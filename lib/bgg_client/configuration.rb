# frzoen_string_literal: true

require "anyway_config"

module BggClient
  class Configuration < Anyway::Config
    config_name :bgg_client
    attr_config base_url: "https://boardgamegeek.com/xmlapi2"
  end
end
