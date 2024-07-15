# frozen_string_literal: true

RSpec.describe BggClient do
  before do
    described_class.configure do |config|
      config.base_url = "https://boardgamegeek.com/xmlapi2"
    end
  end

  it "has a version number" do
    expect(described_class::VERSION).not_to be_nil
  end

  it "has a configuration" do
    described_class.configure do |config|
      config.base_url = "https://google.com"
    end

    expect(described_class.configuration.base_url).to eq("https://google.com")
  end

  it "connects to Board Game Geek" do
    VCR.use_cassette("bgg_client_connection") do
      response = described_class.connection.get("thing?id=1")
      expect(response.status).to eq(200)
    end
  end
end
