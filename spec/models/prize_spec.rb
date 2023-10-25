# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Prize, type: :model do
  describe 'validation' do
    describe 'winners_count_is_positive' do
      let(:lottery) { create(:lottery) }

      it 'is invalid with a negative winners count' do
        invalid_prize = build(:prize, lottery:, winners_count: -1)
        invalid_prize.valid?
        expect(lottery.errors[:prizes]).to include('は1以上を指定してください。')
      end
    end
  end
end
