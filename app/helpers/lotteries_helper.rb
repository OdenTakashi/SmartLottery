# frozen_string_literal: true

module LotteriesHelper
  def closed?(lottery)
    lottery.deadline < Time.zone.today
  end

  def total_winners(lottery)
    lottery.prizes.sum(&:winners_count)
  end
end
