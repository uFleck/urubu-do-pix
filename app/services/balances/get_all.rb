# frozen_string_literal: true

require './app/adapters/repositories/balance_repository'

module Balances
  class GetAll
    def self.execute()
      BalanceRepository.all
    end
  end
end
