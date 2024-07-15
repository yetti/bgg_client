# frozen_string_literal: true

require "bgg_client"

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
  add_filter "spec"
  add_filter "bin"

  add_group "Libraries", "lib"

  minimum_coverage line: 80
  maximum_coverage_drop 5
end

SimpleCov.start if ENV.fetch("CI", false) == "true"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
