# frozen_string_literal: true

class TransactionRepository < ActiveRecord::Base
  belongs_to :balance
  self.table_name = 'transactions'
end
