# frozen_string_literal: true

module EntriesHelper
  def winning_entries(lottery)
    lottery.entries.select do |entry|
      entry.prize.present?
    end
  end
end
