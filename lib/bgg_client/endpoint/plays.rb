# frozen_string_literal: true

module BggClient
  module Endpoint
    class Plays
      THING_TYPES = %w[thing family].freeze

      SUBTYPE_TYPES = %w[boardgame boardgameexpansion boardgameaccessory boardgameintegration boardgamecompilation boardgameimplementation rpg rpgitem videogame].freeze

      def initialize(connection:)
        @connection = connection
      end

      def self.get(username:, id:, type: "", min_date: "", max_date: "", subtype: "", page: 1)
        if username.nil?
          raise Faraday::BadRequestError, "username is required"
        end

        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        unless min_date.empty?
          unless Utils::DateValidation.valid_ymd?(min_date)
            raise Faraday::BadRequestError, "min_date is invalid"
          end
        end

        unless max_date.empty?
          unless Utils::DateValidation.valid_ymd?(max_date)
            raise Faraday::BadRequestError, "max_date is invalid"
          end
        end

        unless subtype.empty?
          unless SUBTYPE_TYPES.include?(subtype)
            raise Faraday::BadRequestError, "subtype is invalid. Must be one of #{SUBTYPE_TYPES.join(", ")}"
          end
        end

        response = @connection.get("plays", {
          username: username,
          id: id,
          type: type,
          mindate: min_date,
          maxdate: max_date,
          subtype: subtype,
          page: page
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
