# frozen_string_literal: true

require "ostruct"
require "faraday"
require "faraday/request/url_encoded"
require "faraday/response/raise_error"
require "httpx/adapters/faraday"
require_relative "bgg_client/version"
require_relative "bgg_client/configuration"
require_relative "bgg_client/endpoint"

module BggClient
  class Error < StandardError; end

  BASE_URL = "https://boardgamegeek.com/xmlapi2"

  def self.connection
    @connection ||= Faraday.new(url: BASE_URL) do |f|
      f.use Faraday::Request::UrlEncoded
      f.use Faraday::Response::RaiseError

      f.request :url_encoded
      f.adapter :httpx
    end
  end

  def self.things
    @things ||= Things.new(connection: connection)
  end

  def self.families
    @families ||= Families.new(connection: connection)
  end

  def self.forum_lists
    @forum_lists ||= ForumLists.new(connection: connection)
  end

  def self.forums
    @forums ||= Forums.new(connection: connection)
  end

  def self.threads
    @threads ||= Threads.new(connection: connection)
  end

  def self.users
    @users ||= Users.new(connection: connection)
  end

  def self.guilds
    @guilds ||= Guilds.new(connection: connection)
  end

  def self.plays
    @plays ||= Plays.new(connection: connection)
  end

  def self.collections
    @collections ||= Collections.new(connection: connection)
  end
end
