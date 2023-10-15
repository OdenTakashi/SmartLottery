# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LotteriesHelper, type: :helper do
  let(:lottery) { create(:lottery) }
  let!(:lottery_executed) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday) }

  it 'lottery_executed?' do
    Lottery.execute
    expect(lottery_executed?(lottery_executed)).to eq true
    expect(lottery_executed?(lottery)).to eq false
  end

  it 'closed?' do
    expect(closed?(lottery_executed)).to eq true
    expect(closed?(lottery)).to eq false
  end

  it 'total_winners' do
    expect(total_winners(lottery)).to eq 6
  end

  it 'extra_prizes_count' do
    expect(extra_prizes_count(lottery)).to eq 1
  end
end
