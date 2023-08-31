# frozen_string_literal: true
require_relative './shared/entity'

class Balance
  include Entity

  attr_accessor :value, :user_id

  def initialize(value:, user_id:)
    @value = value
    @user_id = user_id
  end
end
