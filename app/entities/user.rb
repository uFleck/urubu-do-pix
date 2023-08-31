# frozen_string_literal: true
require_relative './shared/entity'

class User
  include Entity

  attr_accessor :name, :balance_id

  def initialize(name:, balance_id: nil)
    @name = name
    @balance_id = balance_id
  end
end
