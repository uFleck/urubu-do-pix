# frozen_string_literal: true

require 'spec_helper'
require './app/services/transactions/create'
require './app/services/transactions/operations'

RSpec.describe Transactions::Create do
  describe '.execute' do
    let(:balance) { BalanceRepository.first }
    let(:params) { { type: Transactions::Operations::DEPOSIT.to_s, value: 100, balance_id: balance.id } }

    it 'should create a valid transaction' do
      expect {
        described_class.execute(params)
      }.to change(TransactionRepository, :count).by(1)

      new_transaction = TransactionRepository.last

      expect(new_transaction.value).to eq(params[:value])
      expect(new_transaction.operation).to eq(params[:operation])
      expect(new_transaction.balance_id).to eq(params[:balance_id])
    end
  end
end
