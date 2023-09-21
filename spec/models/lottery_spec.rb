# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :model do
  include LotteriesHelper

  describe 'run' do
    let!(:closed_lottery) { create(:lottery, deadline: Time.zone.yesterday) }
    let!(:open_lottery) { create(:lottery, deadline: Time.zone.today) }
    let!(:closed_lottery_2days_ago) { create(:lottery, deadline: Time.zone.today.ago(2.days)) }

    before do
      described_class.run
    end

    it 'lottery executed' do
      expect(lottery_executed?(closed_lottery)).to be_truthy
    end

    it 'open lottery do not executed' do
      expect(lottery_executed?(open_lottery)).to be_falsey
    end

    it 'closed lottery 2days ago do not executed' do
      expect(lottery_executed?(closed_lottery_2days_ago)).to be_falsey
    end
  end
end
