# Rails Fast Kafka Consumer

This is a meta-gem packaging other gems for performance optimization. It currently includes 
1. Kafka Intake, which sets up a Kafka consumer to generate Request objects and run them as requests in the server. Those requests then return responses to the Kafka queues. This is to be run behind a high-performance proxy server like the one shown (in Go) in that gem's repository. It can be set to poll for many messages at once, running their corresponding requests in parallel using Ractors rather than filling the Rails thread pool, while using SQL Savepoints to retain atomicity.
2. Rails Bulk Writer, which caches Write operations in a local SQLite database to be sent to the primary DB as bulk queries just before the Commit. While there can be issues with record-relations, in most use-cases it also pulls from the SQLite cache when reading to account for reading records written in the same transaction. 

If Kafka Intake is set to poll for many messages at once, Rails Bulk Writer will optimize DB contact for Write operations. Read operations can usually run on Read Replicas, which can scale out. 

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rails_fast_kafka_consumer

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rails_fast_kafka_consumer

## Usage

Full usage instructions will be added later. For now, just read the instructions for the [Kafka Reader](https://github.com/stephenamsel/Rails-Kafka-Intake) and [DB optimizer](https://github.com/stephenamsel/rails-bulk-writer?tab=readme-ov-file#usage).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_fast_kafka_consumer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rails_fast_kafka_consumer/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsFastKafkaConsumer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_fast_kafka_consumer/blob/master/CODE_OF_CONDUCT.md).
