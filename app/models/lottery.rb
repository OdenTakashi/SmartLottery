# frozen_string_literal: true

class Lottery < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :prizes,
                                allow_destroy: true,
                                reject_if: :all_blank
  validates :prizes, presence: true

  def run
    prize_list = prizes
    entry_list = entries.to_a

    prize_list.each do |prize|
      winning_entries = sample_randomly(entry_list, prize)
      assign_prize_info(winning_entries, prize)
      entries.reject! { |entry| entry.prize.present? }
    end
  end

  private

  def sample_randomly(entries, prize)
    entries.sample(prize.winners_count)
  end

  def assign_prize_info(winning_entries, prize)
    winning_entries.each do |winning_entry|
      winning_entry.update_prize(prize)
    end
  end
end
