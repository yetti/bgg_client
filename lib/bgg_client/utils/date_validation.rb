# frozen_string_literal: true

module BggClient
  module Utils
    module DateValidation
      def self.valid_ymd?(date)
        valid_date?(date: date, format: /\A\d{4}-\d{2}-\d{2}\z/)
      end

      def self.valid_datetime?(date)
        valid_date?(date: date, format: /\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\z/)
      end

      def self.valid_date?(date:, format:)
        format_ok = date.match(format)
        parseable = begin
          Date.strptime(date, format)
        rescue
          false
        end

        format_ok && parseable
      end
    end
  end
end
