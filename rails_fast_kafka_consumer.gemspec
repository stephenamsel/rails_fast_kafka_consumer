# frozen_string_literal: true

require_relative "lib/rails_fast_kafka_consumer/version"

Gem::Specification.new do |spec|
  spec.name = "rails_fast_kafka_consumer"
  spec.version = RailsFastKafkaConsumer::VERSION
  spec.authors = ["stephenamsel"]
  spec.email = ["amselstephen@gmail.com"]

  spec.summary = "Use Rails as a high-performance Kafka consumer"
  spec.description = "Optimize Rails' performance for high-throughput services, using this Gem to place it between Kafka and the Database."
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/stephenamsel/rails_fast_kafka_consumer"
  spec.metadata["changelog_uri"] = "https://github.com/stephenamsel/rails_fast_kafka_consumer/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "kafka_intake"
  spec.add_dependency "rails_bulk_writer"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
