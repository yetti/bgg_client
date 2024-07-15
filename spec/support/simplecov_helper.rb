# frozen_string_literal: true

require "simplecov"
require "simplecov-cobertura"

SimpleCov.configure do
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::CoberturaFormatter
  ])
  add_filter do |source_file|
    source_file.lines.count < 10
  end
  add_filter "spec/support"
  add_filter "spec/cassettes"
  add_filter "bin"

  add_group "Libraries", "lib"

  minimum_coverage line: 80
  maximum_coverage_drop 5
end

SimpleCov.start if ENV.fetch("CI", false) == "true"
