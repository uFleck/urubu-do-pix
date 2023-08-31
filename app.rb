# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
require './app/adapters/controllers/users_controller'
require './app/adapters/controllers/balances_controller'
require './app/adapters/controllers/transactions_controller'
require './config/tasks_config'

Dotenv.load

if ENV['RACK_ENV'] == 'test'
  set :database, { adapter: 'sqlite3', database: ENV.fetch('TEST_DB_PATH', nil) }
else
  set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH', nil) }
end

post '/users' do
  { result: UsersController.create(params) }.to_json
end

post '/balances' do
  { result: BalancesController.create(params) }.to_json
end

post '/transactions' do
  { result: TransactionsController.create(params) }.to_json
end

thread = Thread.new do
  loop do
    TasksConfig.run_all_tasks
    sleep 86400
  end
end
