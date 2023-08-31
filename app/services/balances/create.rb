# frozen_string_literal: true

require './app/entities/balance'
require './app/adapters/repositories/balance_repository'

module Balances
  class Create
    def self.execute(params)
      balance = Balance.new(value: params[:value], user_id: params[:user_id])
      BalanceRepository.create!(balance.to_hash)
    end
  end
end
