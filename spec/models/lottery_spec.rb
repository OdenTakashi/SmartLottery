# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :model do
  include LotteriesHelper

  describe 'run' do
    let!(:closed_lottery) { create(:lottery, deadline: Time.zone.yesterday) }
    let!(:open_lottery) { create(:lottery, deadline: Time.zone.today) }

    it 'lottery executed' do
      described_class.run
      expect(lottery_executed?(closed_lottery)).to eq true
    end

    it 'not lottery executed' do
      described_class.run
      expect(lottery_executed?(open_lottery)).to eq false
    end
  end
end
