# frozen_string_literal: true

require 'sinatra/activerecord/rake'
require 'dotenv'
Dotenv.load

namespace :db do
  task load_config: :environment do
    require './app'
  end

  task :migrate_all do
    db_files = {
      development: ENV['DB_PATH'],
      test: ENV['TEST_DB_PATH']
    }

    db_files.each do |env, db_file|
      Rake::Task['db:migrate'].invoke(env, db_file)
    end

    puts 'everything gone well!'
  end

  task :setup_test do
    Rake::Task['db:load_config'].invoke

    test_db_config = {
      adapter: 'sqlite3',
      database: ENV['TEST_DB_PATH']
    }

    ActiveRecord::Base.establish_connection(test_db_config)
    ActiveRecord::Tasks::DatabaseTasks.create(test_db_config)
    ActiveRecord::Tasks::DatabaseTasks.migrate
    puts "Test database setup complete."
  end
end
