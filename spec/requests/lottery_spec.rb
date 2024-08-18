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

  describe 'GET /lotteries/:id' do
    subject(:request_show) { get lottery_path(lottery) }

    let(:user) { create(:user) }
    let(:lottery) { create(:lottery) }

    it 'return 200 status' do
      sign_in user
      request_show

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /lotteries/new' do
    subject(:request_new) { get new_lottery_path }

    let(:user) { create(:user) }

    it 'return 200 status' do
      sign_in user
      request_new

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /lotteries' do
    subject(:request_create) { post lotteries_path(params) }

    let(:user) { create(:user) }
    let(:params) do
      { lottery: {
        user_id: user.id,
        name: 'テストの抽選会',
        description: 'テストの説明',
        deadline: '2024-08-19',
        name_field_enabled: true,
        note_field_enabled: true,
        prizes_attributes: [
          { name: '商品名',
            winners_count: 2,
            winning_email_subject: 'テストの件名',
            winning_email_body: 'テストの本文',
            _destroy: false }
        ]
      } }
    end

    it 'create lottery successful' do
      sign_in user

      expect { request_create }.to change(described_class, :count).by(1)
      expect(response).to have_http_status(:found)
    end
  end

  describe 'PATCH /lotteries/:id' do
    subject(:request_update) { patch lottery_path(lottery), params: }

    let(:user) { create(:user) }
    let(:lottery) { create(:lottery) }
    let(:params) do
      {
        lottery: {
          name: '更新された抽選会',
          description: lottery.description,
          deadline: lottery.deadline,
          name_field_enabled: lottery.name_field_enabled,
          note_field_enabled: lottery.note_field_enabled,
          prizes_attributes: lottery.prizes.map { |prize| prize.attributes.except('id', 'created_at', 'updated_at') }
        }
      }
    end

    it 'update lottery successful' do
      sign_in user
      expect do
        request_update
        lottery.reload
      end.to change(lottery, :name).from('チケットの抽選会').to('更新された抽選会')
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE /lotteries/:id' do
    subject(:request_delete) { delete lottery_path(lottery) }

    let(:user) { create(:user) }
    let!(:lottery) { create(:lottery) }

    it 'delete lottery successful' do
      sign_in user

      expect { request_delete }.to change(described_class, :count).by(-1)
      expect(response).to have_http_status(:found)
    end
  end
end
