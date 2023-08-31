# frozen_string_literal: true

require './app/adapters/repositories/balance_repository'
require './app/services/transactions/create'
require './app/services/transactions/operations'

module Balances
  class ApplyProfit
    def self.execute(factor)
      balances = BalanceRepository.where.not(user_id: nil).where("value > 0")

      balances.each do |balance|
        profit = balance.value * factor
        Transactions::Create.execute({ operation: Transactions::Operations::PROFIT, value: profit, balance_id: balance.id })
      end
    end
  end
end
