# frozen_string_literal: true

require './app/entities/transaction'
require './app/adapters/repositories/transaction_repository'
require './app/services/balances/update'

module Transactions
  class Create
    def self.execute(params)
      transaction = Transaction.new(operation: params[:operation], value: params[:value], balance_id: params[:balance_id])
      TransactionRepository.create(transaction.to_hash)
      Balances::Update.by_id(params[:balance_id])
      transaction
    end
  end
end
