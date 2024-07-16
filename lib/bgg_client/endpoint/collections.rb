# frozen_string_literal: true

module BggClient
  module Endpoint
    class Collections
      def initialize(connection:)
        @connection = connection
      end

      def self.get(
        username:,
        version: 1,
        subtype: "",
        excludesubtype: "",
        id: "",
        brief: 1,
        stats: 1,
        own: nil,
        rated: nil,
        played: nil,
        comment: nil,
        trade: nil,
        want: nil,
        wishlist: nil,
        wishlistpriority: nil,
        preordered: nil,
        wanttoplay: nil,
        wanttobuy: nil,
        prevowned: nil,
        hasparts: nil,
        wantparts: nil,
        minrating: nil,
        rating: nil,
        minbggrating: nil,
        bggrating: nil,
        minplays: nil,
        maxplays: nil,
        showprivate: 1,
        collid: "",
        modifiedsince: ""
      )
        if username.nil?
          raise Faraday::BadRequestError, "username is required"
        end

        # Since collections can be very large, BGG fetches this data asynchronously and caches it
        # so that it is available on subsequent requests. This means that the first request may
        # return a 202 Accepted status code, and the client should wait a few seconds before trying
        # again.
        loop do
          response = @connection.get("collection", {
            username: username,
            version: version,
            subtype: subtype,
            excludesubtype: excludesubtype,
            id: id,
            brief: brief,
            stats: stats,
            own: own,
            rated: rated,
            played: played,
            comment: comment,
            trade: trade,
            want: want,
            wishlist: wishlist,
            wishlistpriority: wishlistpriority,
            preordered: preordered,
            wanttoplay: wanttoplay,
            wanttobuy: wanttobuy,
            prevowned: prevowned,
            hasparts: hasparts,
            wantparts: wantparts,
            minrating: minrating,
            rating: rating,
            minbggrating: minbggrating,
            bggrating: bggrating,
            minplays: minplays,
            maxplays: maxplays,
            showprivate: showprivate,
            collid: collid,
            modifiedsince: modifiedsince
          })
          break if response.status != 202
          sleep 3.second
        end

        if response.status == 200
          response.body
        end
      end
    end
  end
end
