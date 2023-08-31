# frozen_string_literal: true

require 'spec_helper'
require './app/services/users/create'
require './app/entities/user'
require 'byebug'

RSpec.describe Users::Create do
  describe '.execute' do
    let(:params) { { name: 'Bruno Testão' } }

    it 'creates a valid user' do
      expect {
        described_class.execute(params)
      }.to change(UserRepository, :count).by(1)

      new_user = UserRepository.last

      expect(new_user.balance_id).not_to be_nil
      expect(new_user.name).to eq(params[:name])
    end
  end
end
