# frozen_string_literal: true

RSpec.describe BggClient do
  it "has a version number" do
    expect(BggClient::VERSION).not_to be_nil
  end
end
