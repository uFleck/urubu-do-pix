# frozen_string_literal: true

require_relative './shared/entity'

class Transaction
  include Entity

  attr_accessor :operation, :value, :balance_id

  def initialize(operation:, value:, balance_id:)
    @operation = operation
    @value = value
    @balance_id = balance_id
  end
end
