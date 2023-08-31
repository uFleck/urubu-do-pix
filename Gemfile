# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |_repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv'
gem 'puma'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sqlite3'
gem 'tzinfo'

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'database_cleaner'
end

group :development do
  gem 'byebug'
end
