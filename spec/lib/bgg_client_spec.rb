# frozen_string_literal: true

RSpec.describe BggClient do
  it "has a version number" do
    expect(described_class::VERSION).not_to be_nil
  end

  it "connects to Board Game Geek" do
    VCR.use_cassette("bgg_client_connection") do
      response = described_class.connection.get("thing?id=1")
      expect(response.status).to eq(200)
    end
  end
end
