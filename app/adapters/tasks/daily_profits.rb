# frozen_string_literal: true

require_relative './shared/task'
require './app/services/balances/apply_profit'
require 'byebug'

class DailyProfits
  include Task

  PROFIT_FACTOR = 0.333

  def self.run
    Balances::ApplyProfit.execute(PROFIT_FACTOR)
  end
end
