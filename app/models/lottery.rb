# frozen_string_literal: true

class Lottery < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :prizes,
                                allow_destroy: true,
                                reject_if: :all_blank
  validates :prizes, presence: true
  validates :deadline, presence: true
  validate :deadline_later_than_today
  scope :closed_lottery, -> { where('deadline = ?', Time.zone.today.ago(1.day).to_date) }

  def self.run
    Lottery.closed_lottery.each(&:execute)
  end

  def execute
    entry_list = entries.to_a

    prizes.each do |prize|
      winning_entries = sample_randomly(entry_list, prize)
      assign_prize_info(winning_entries, prize)
      entry_list.reject! { |entry| entry.prize.present? }
    end
  end

  private

  def sample_randomly(entry_list, prize)
    entry_list.sample(prize.winners_count)
  end

  def assign_prize_info(winning_entries, prize)
    winning_entries.each do |winning_entry|
      winning_entry.update_prize(prize)
    end
  end

  def deadline_later_than_today
    return unless deadline < Time.zone.today

    errors.add(:deadline, 'は本日以降を指定してください')
  end
end
