# frozen_string_literal: true

require_relative "lib/bgg_client/version"

Gem::Specification.new do |spec|
  spec.name = "bgg_client"
  spec.version = BggClient::VERSION
  spec.authors = ["Yetrina Battad"]
  spec.email = ["hello@yetti.io"]

  spec.summary = "Client for Board Game Geek's XML API2"
  spec.description = "Consume Board Game Geek's XML API2 with ease."
  spec.homepage = "https://github.com/yetti/bgg_client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yetti/bgg_client"
  spec.metadata["changelog_uri"] = "https://github.com/yetti/bgg_client/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "anyway_config", "~> 2.6"
  spec.add_dependency "faraday", "~> 2.10"
  spec.add_dependency "httpx", "~> 1.3"
  spec.add_dependency "ox", "~> 2.14"
end
