# frozen_string_literal: true

require './app/services/users/create'

class UsersController
  def self.create(params)
    Users::Create.execute(params)
  end
end
