# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in bgg_client.gemspec
gemspec

gem "ruby-lsp", "~> 0.17.7", require: false

gem "rake", "~> 13.0"

gem "mutex_m", "~> 0.2.0"

group :test do
  gem "rspec", "~> 3.0"

  gem "rubocop", "~> 1.21"
  gem "rubocop-rspec", "~> 3.0.3", require: false
  gem "rubocop-performance", "~> 1.21", require: false

  gem "standard", ">= 1.35.1", require: false

  gem "simplecov", "~> 0.22.0"
  gem "simplecov-cobertura", "~> 2.1"

  gem "vcr", "~> 6.2"
  gem "webmock", "~> 3.23"
  gem "base64", "~> 0.2.0"
end
