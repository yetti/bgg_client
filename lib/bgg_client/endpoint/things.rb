# frozen_string_literal: true

module BggClient
  module Endpoint
    class Things
      def initialize(connection:)
        @connection = connection
      end

      def get(id:, type: "", versions: 1, videos: 1, stats: 1, historical: 1, marketplace: 1, comments: 1, rating_comments: 1, page_size: 10)
        if id.nil?
          raise Faraday::BadRequestError, "id is required"
        end

        # enforce minimum and maximum page size
        @page_size = page_size.dup
        if @page_size < 10
          @page_size = 10
        end
        if @page_size > 100
          @page_size = 100
        end

        response = @connection.get("thing", {
          id: id,
          type: type,
          versions: versions,
          videos: videos,
          stats: stats,
          historical: historical,
          marketplace: marketplace,
          comments: comments,
          ratingcomments: rating_comments,
          page_size: @page_size
        })

        if response.status == 200
          response.body
        end
      end
    end
  end
end
