# frozen_string_literal: true

require 'spec_helper'
require './app/entities/user'

RSpec.describe User do
  let(:user_mock) { { name: 'Bruno Koster', balance_id: 1 } }

  describe '#initialize' do
    it 'should create a new user with name and balance_id' do
      user = User.new(name: user_mock[:name], balance_id: user_mock[:balance_id])

      expect(user.name).to eq(user_mock[:name])
      expect(user.balance_id).to eq(user_mock[:balance_id])
    end

    it 'should create a new user with default balance_id' do
      user = User.new(name: user_mock[:name])

      expect(user.name).to eq(user_mock[:name])
      expect(user.balance_id).to be_nil
    end
  end

  describe '#to_hash' do
    it 'should return a hash of user' do
      user = User.new(name: user_mock[:name], balance_id: user_mock[:balance_id])

      expect(user.to_hash).to eq(user_mock)
    end
  end
end
