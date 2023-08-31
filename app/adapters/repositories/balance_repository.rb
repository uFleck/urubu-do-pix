# frozen_string_literal: true

class BalanceRepository < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  self.table_name = 'balances'
end

