# frozen_string_literal: true

module LotteriesHelper
  DISPLAY_LIMIT = 2

  def lottery_executed?(lottery)
    lottery.prizes.any? { |prize| prize.entries.any? }
  end

  def closed?(lottery)
    lottery.deadline < Time.zone.today
  end

  def total_winners(lottery)
    lottery.prizes.sum(&:winners_count)
  end

  def extra_prizes_count(lottery)
    lottery.prizes.count - DISPLAY_LIMIT
  end
end
