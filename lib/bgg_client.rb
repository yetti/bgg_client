# frozen_string_literal: true

require "ostruct"
require_relative "bgg_client/version"
require_relative "bgg_client/configuration"

module BggClient
  class Error < StandardError; end

  def self.configuration
    @configuration ||= BggClient::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
