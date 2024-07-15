# frozen_string_literal: true

require "webmock/rspec"

# WebMock.allow_net_connect!
# Disables HTTP requests, with the exception of requests to localhost
WebMock.disable_net_connect!(
  allow_localhost: true
)
