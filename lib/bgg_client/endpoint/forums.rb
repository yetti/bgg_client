# frozen_string_literal: true

module BggClient
  module Endpoint
    class Forums
      def initialize(connection:)
        @connection = connection
      end

      def self.get(id:, page:)
        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        # enforce maximum page number
        @page = page.dup
        if @page > 50
          @page = 50
        end

        response = @connection.get("forum", {
          id: id,
          page: @page
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
