# frozen_string_literal: true

class UserRepository < ActiveRecord::Base
  has_one :balance
  self.table_name = 'users'
end
