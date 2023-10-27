# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LotteriesHelper, type: :helper do
  let(:lottery) { create(:lottery) }
  let!(:lottery_closing_yesterday) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday) }

  describe '#lottery_executed?' do
    before do
      Lottery.execute
    end

    it 'returns true for lottery closed yesterday' do
      expect(lottery_executed?(lottery_closing_yesterday)).to eq true
    end

    it 'returns false for lottery closing tomorrow' do
      expect(lottery_executed?(lottery)).to eq false
    end
  end

  describe '#closed?' do
    it 'returns true for lottery closed yesterday' do
      expect(closed?(lottery_closing_yesterday)).to eq true
    end

    it 'returns false for lottery closing tomorrow' do
      expect(closed?(lottery)).to eq false
    end
  end

  describe '#total_winners' do
    it 'returns 6 for total winners' do
      expect(total_winners(lottery)).to eq 6
    end
  end

  describe '#description_template' do
    it 'displays template' do
      expect(description_template).to eq "この抽選会はXXX株式会社の提供で行われます。\n備考にはxxxを書いてください\n"
    end
  end
end
