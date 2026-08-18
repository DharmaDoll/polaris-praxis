#!/usr/bin/env ruby

require "date"
require "pathname"
require "set"
require "yaml"

ROOT = Pathname.new(__dir__).join("..").expand_path
FORBIDDEN_KPI_EXPRESSION = /(?:%|％|パーセント|percentage|percent|割合|比率|達成率|準拠率|検知率|カバー率|\brate\b|\bratio\b|\d+\s*\/\s*\d+)/i

REGISTER_RULES = {
  "assumptions.yaml" => {
    root: "assumptions",
    id: /\AASM-\d{3,}\z/,
    required: %w[id statement confidence evidence validation_method status]
  },
  "decisions.yaml" => {
    root: "decisions",
    id: /\ADEC-\d{3,}\z/,
    required: %w[id title status decision_record date]
  },
  "initiatives.yaml" => {
    root: "initiatives",
    id: /\AINIT-\d{3,}\z/,
    required: %w[id title strategic_objective period status risks kpis owner]
  },
  "kpis.yaml" => {
    root: "kpis",
    id: /\AKPI-\d{3,}\z/,
    required: %w[id title objectives initiatives outcome_type measurement_mode unit baseline target period owner evidence status]
  },
  "objectives.yaml" => {
    root: "objectives",
    id: /\AOBJ-\d{3,}\z/,
    required: %w[id title period company_goals organization_goals outcome risks attack_paths initiatives kpis owner decision_authority status evidence]
  },
  "risks.yaml" => {
    root: "risks",
    id: /\ARISK-\d{3,}\z/,
    required: %w[id title business_service crown_jewel threat attack_paths inherent_risk residual_risk owner treatment evidence]
  },
  "unknowns.yaml" => {
    root: "unknowns",
    id: /\AUNKNOWN-\d{3,}\z/,
    required: %w[id topic question status priority owner needed_for created_at]
  }
}.freeze

errors = []
seen_ids = Set.new
records_by_register = {}

REGISTER_RULES.each do |filename, rule|
  path = ROOT.join("registers", filename)

  unless path.file?
    errors << "Missing register: #{path.relative_path_from(ROOT)}"
    next
  end

  begin
    document = YAML.safe_load_file(path, permitted_classes: [Date], aliases: false)
  rescue Psych::Exception => e
    errors << "Invalid YAML in #{path.relative_path_from(ROOT)}: #{e.message.lines.first.strip}"
    next
  end

  unless document.is_a?(Hash) && document[rule[:root]].is_a?(Array)
    errors << "#{path.relative_path_from(ROOT)} must contain a top-level '#{rule[:root]}' array"
    next
  end

  records_by_register[filename] = document[rule[:root]]

  document[rule[:root]].each_with_index do |record, index|
    location = "#{path.relative_path_from(ROOT)} record #{index + 1}"

    unless record.is_a?(Hash)
      errors << "#{location} must be a mapping"
      next
    end

    missing = rule[:required].reject { |field| record.key?(field) && !record[field].nil? }
    errors << "#{location} missing fields: #{missing.join(', ')}" unless missing.empty?

    id = record["id"]
    next unless id

    errors << "#{location} has invalid id: #{id}" unless rule[:id].match?(id)
    errors << "Duplicate id: #{id}" if seen_ids.include?(id)
    seen_ids << id

    if %w[objectives.yaml initiatives.yaml].include?(filename) && record["kpis"].is_a?(Array) && record["kpis"].empty?
      errors << "#{location} must reference at least one KPI"
    end

    if filename == "decisions.yaml" && record["decision_record"].is_a?(String)
      reference = ROOT.join(record["decision_record"])
      errors << "#{location} references missing file: #{record['decision_record']}" unless reference.file?
    end


    if filename == "kpis.yaml"
      allowed_modes = %w[count duration date amount absolute-quantity state]
      mode = record["measurement_mode"]
      errors << "#{location} has invalid measurement_mode: #{mode}" if mode && !allowed_modes.include?(mode)

      %w[title unit baseline target].each do |field|
        value = record[field]
        next unless value.is_a?(String) && FORBIDDEN_KPI_EXPRESSION.match?(value)

        errors << "#{location} uses a forbidden proportion expression in #{field}: #{value}"
      end
    end
  end
end

ROOT.glob("registers/*.{yaml,yml}").each do |register|
  next unless register.read.match?(/\b(?:EX|SYN)-[A-Z0-9-]+\b/)

  errors << "Synthetic sample identifier found in authoritative register: #{register.relative_path_from(ROOT)}"
end

kpi_ids = Set.new(Array(records_by_register["kpis.yaml"]).filter_map { |record| record["id"] if record.is_a?(Hash) })
%w[objectives.yaml initiatives.yaml].each do |filename|
  Array(records_by_register[filename]).each_with_index do |record, index|
    next unless record.is_a?(Hash) && record["kpis"].is_a?(Array)

    record["kpis"].each do |kpi_id|
      next if kpi_ids.include?(kpi_id)

      errors << "registers/#{filename} record #{index + 1} references unknown KPI: #{kpi_id}"
    end
  end
end

ROOT.glob("metrics/**/*.md").each do |kpi_document|
  measurable_content = kpi_document.read.split(/^## Non-ratio Check\s*$/, 2).first
  next unless FORBIDDEN_KPI_EXPRESSION.match?(measurable_content)

  errors << "KPI document uses a forbidden proportion expression: #{kpi_document.relative_path_from(ROOT)}"
end

ROOT.glob("**/*.md").each do |markdown|
  relative_markdown = markdown.relative_path_from(ROOT)
  markdown.read.scan(/\[[^\]]+\]\(([^)]+)\)/).flatten.each do |link|
    next if link.empty? || link.start_with?("#")
    next if link.match?(/\A(?:https?:|mailto:)/)
    next if link.include?("<") || link.include?(">")

    target = link.split("#", 2).first
    resolved = markdown.dirname.join(target).cleanpath
    errors << "Broken Markdown link in #{relative_markdown}: #{link}" unless resolved.exist?
  end
end

if errors.empty?
  puts "Repository validation passed"
  exit 0
end

warn "Repository validation failed:"
errors.each { |error| warn "- #{error}" }
exit 1
