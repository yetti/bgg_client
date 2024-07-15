# frozen_string_literal: true

RSpec.describe BggClient do
  it "has a version number" do
    expect(described_class::VERSION).not_to be_nil
  end

  it "has a configuration" do
    described_class.configure do |config|
      config.base_url = "https://google.com"
    end

    expect(described_class.configuration.base_url).to eq("https://google.com")
  end
end
