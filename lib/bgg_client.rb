# frozen_string_literal: true

require "ostruct"
require "faraday"
require "faraday/request/url_encoded"
require "faraday/response/raise_error"
require "httpx/adapters/faraday"
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

  def self.connection
    @connection ||= Faraday.new(url: BggClient.configuration.base_url) do |f|
      f.use Faraday::Request::UrlEncoded
      f.use Faraday::Response::RaiseError

      f.request :url_encoded
      f.adapter :httpx
    end
  end
end
