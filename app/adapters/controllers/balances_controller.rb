# frozen_string_literal: true

require './app/services/balances/create'

class BalancesController
  def self.create(params)
    Balances::Create.execute(params)
  end
end
