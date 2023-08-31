# frozen_string_literal: true

require './app/adapters/repositories/balance_repository'
require './app/adapters/repositories/transaction_repository'

module Balances
  class Update
    def self.by_id(id)
      balance = BalanceRepository.find(id)
      total_transactions_value = TransactionRepository.where(balance_id: id).sum(:value)
      balance.update(value: total_transactions_value)
    end
  end
end
