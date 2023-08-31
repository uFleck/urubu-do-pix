# frozen_string_literal: true

require './app/services/transactions/create'

class TransactionsController
  def self.create(params)
    Transactions::Create.execute(params)
  end
end
