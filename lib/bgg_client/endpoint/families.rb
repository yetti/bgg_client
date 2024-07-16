# frozen_string_literal: true

module BggClient
  module Endpoint
    class Families
      def initialize(connection:)
        @connection = connection
      end

      def self.get(id:, type: "")
        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        response = @connection.get("family", {
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
