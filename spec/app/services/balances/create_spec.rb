# frozen_string_literal: true

require 'spec_helper'
require './app/services/balances/create'

RSpec.describe Balances::Create do
  describe '.execute' do
    let(:user) { UserRepository.first }
    let(:params) { { value: 100, user_id: user.id } }

    it 'should create a valid balance' do
      expect {
        described_class.execute(params)
      }.to change(BalanceRepository, :count).by(1)

      new_balance = BalanceRepository.last
      expect(new_balance.value).to eq(100)
      expect(new_balance.user_id).to eq(user.id)
    end
  end
end
