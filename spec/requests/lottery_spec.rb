# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :request do
  describe 'GET /lotteries' do
    subject(:request_index) { get lotteries_path }

    let(:user) { create(:user) }

    it 'return 200 status' do
      sign_in user
      request_index

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /lotteries/:id/edit' do
    subject(:request_edit) { get edit_lottery_path(lottery) }

    let(:user) { create(:user) }
    let(:lottery) { create(:lottery) }

    it 'return 200 status' do
      sign_in user
      request_edit

      expect(response).to have_http_status(:ok)
    end
  end
end
