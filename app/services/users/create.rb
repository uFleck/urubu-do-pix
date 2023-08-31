# frozen_string_literal: true

require './app/entities/user'
require './app/adapters/repositories/user_repository'
require './app/adapters/repositories/balance_repository'

module Users
  class Create
    def self.execute(params)
      user = User.new(name: params[:name])
      new_user = UserRepository.create(name: user.name)

      new_balance = BalanceRepository.create(value: 0, user_id: new_user.id)
      new_user.balance_id = new_balance.id

      new_user.save
      new_user
    end
  end
end
