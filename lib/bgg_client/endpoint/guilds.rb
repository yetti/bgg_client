# frozen_string_literal: true

module BggClient
  module Endpoint
    class Guilds
      GUILD_SORT = %w[username date].freeze

      def initialize(connection:)
        @connection = connection
      end

      def self.get(id:, members: 1, sort: "", page: 1)
        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        unless sort.empty?
          unless GUILD_SORT.include?(sort)
            raise Faraday::BadRequestError, "sort is invalid. Must be one of #{GUILD_SORT.join(", ")}"
          end
        end

        response = @connection.get("guild", {
          id: id,
          members: members,
          sort: sort,
          page: page
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
