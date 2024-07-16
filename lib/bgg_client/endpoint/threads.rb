# frozen_string_literal: true

module BggClient
  module Endpoint
    class Threads
      def initialize(connection:)
        @connection = connection
      end

      def self.get(id:, min_article_id: "", min_article_date: "", count: "")
        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        unless min_article_date.empty?
          unless Utils::DateValidation.valid_ymd?(min_article_date) &&
              Utils::DateValidation.valid_datetime?(min_article_date)

            raise Faraday::BadRequestError, "min_article_date is invalid"
          end
        end

        response = @connection.get("threads", {
          id: id,
          minarticleid: min_article_id,
          minarticledate: min_article_date,
          count: count
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
