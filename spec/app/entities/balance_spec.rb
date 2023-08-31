# frozen_string_literal: true

require 'spec_helper'
require './app/entities/balance'

RSpec.describe Balance do
  let(:balance_mock) { { value: 0, user_id: 0 } }

  describe '#initialize' do
    it 'should create a new balance with value and user_id' do
      balance = Balance.new(value: balance_mock[:value], user_id: balance_mock[:user_id])

      expect(balance.value).to eq(balance_mock[:value])
      expect(balance.user_id).to eq(balance_mock[:user_id])
    end
  end

  describe '#to_hash' do
    it 'should return a hash of balance' do
      balance = Balance.new(value: balance_mock[:value], user_id: balance_mock[:user_id])

      expect(balance.to_hash).to eq(balance_mock)
    end
  end
end
