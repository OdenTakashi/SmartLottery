# frozen_string_literal: true

module LotteriesHelper
  def closed?(lottery)
    lottery.deadline < Time.zone.today
  end
end
