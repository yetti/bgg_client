# frozen_string_literal: true

require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.hook_into :faraday
  config.configure_rspec_metadata!
end

# VCR.turn_off!(ignore_cassettes: true)
