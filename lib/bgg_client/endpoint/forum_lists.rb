# frozen_string_literal: true

module BggClient
  module Endpoint
    class ForumLists
      FORUM_LIST_TYPES = %w[thing family].freeze

      def initialize(connection:)
        @connection = connection
      end

      def self.get(id:, type:)
        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        unless FORUM_LIST_TYPES.include?(type)
          raise Faraday::BadRequestError, "type is invalid. Must be one of #{FORUM_LIST_TYPES.join(", ")}"
        end

        response = @connection.get("forumlist", {
          id: id,
          type: type
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
