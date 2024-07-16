# frozen_string_literal: true

module BggClient
  module Endpoint
    class Users
      USER_DOMAINS = %w[boardgame rpg videogame].freeze

      def initialize(connection:)
        @connection = connection
      end

      def self.get(name:, buddies: 1, guilds: 1, hot: 1, top: 1, domain: "", page: 1)
        if name.nil?
          raise Faraday::BadRequestError, "name is required"
        end

        unless domain.empty?
          unless USER_DOMAINS.include?(domain)
            raise Faraday::BadRequestError, "domain is invalid. Must be one of #{USER_DOMAINS.join(", ")}"
          end
        end

        response = @connection.get("user", {
          name: name,
          buddies: buddies,
          guilds: guilds,
          hot: hot,
          top: top,
          domain: domain,
          page: page
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
