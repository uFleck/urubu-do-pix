# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require './config/environment'
require 'database_cleaner'
require './app'

def mock_database_data()
  UserRepository.create(name: "teste")
  UserRepository.create(name: "user with balance")
  BalanceRepository.create(value: 0, user_id: UserRepository.last.id)
  UserRepository.last.balance_id = BalanceRepository.last.id
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

    mock_database_data()
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include Rack::Test::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!
  config.warnings = true
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
