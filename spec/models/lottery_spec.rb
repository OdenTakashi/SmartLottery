# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :model do
  include LotteriesHelper

  describe 'execute' do
    let!(:closed_lottery) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday) }
    let!(:open_lottery) { create(:lottery, deadline: Time.zone.today) }
    let!(:closed_lottery_2days_ago) { create(:lottery, :skip_validate, deadline: Time.zone.today.ago(2.days)) }

    before do
      described_class.execute
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

  describe 'scope' do
    describe 'closed_yesterday' do
      subject(:lotteries_closed_yesterday) { described_class.closed_yesterday }

      let!(:lottery_closed_yesterday) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday) }
      let!(:lottery_closed_today) { create(:lottery, :skip_validate, deadline: Time.zone.today) }

      it 'include lottery_closed_yesterday' do
        expect(lotteries_closed_yesterday).to include lottery_closed_yesterday
      end

      it 'do not include lottery_closed_today' do
        expect(lotteries_closed_yesterday).not_to include lottery_closed_today
      end
    end
  end
end
