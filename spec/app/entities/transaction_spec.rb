# frozen_string_literal: true

require './app/entities/transaction'
require './app/services/transactions/operations'
require 'spec_helper'

RSpec.describe Transaction do
  let(:transaction_mock) { { operation: Transactions::Operations::DEPOSIT, value: 100, balance_id: 1} }

  describe '#initialize' do
    it 'should create a new transaction with all of its properties' do
      transaction = Transaction.new(operation: transaction_mock[:operation], value: transaction_mock[:value], balance_id: transaction_mock[:balance_id])

      expect(transaction.operation).to eq(transaction_mock[:operation])
      expect(transaction.value).to eq(transaction_mock[:value])
      expect(transaction.balance_id).to eq(transaction_mock[:balance_id])
    end
  end

  describe '#to_hash' do
    it 'should return a hash of transaction' do
      transaction = Transaction.new(operation: transaction_mock[:operation], value: transaction_mock[:value], balance_id: transaction_mock[:balance_id])

      expect(transaction.to_hash).to eq(transaction_mock)
    end
  end
end
