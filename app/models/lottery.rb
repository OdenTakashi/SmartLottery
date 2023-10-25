# frozen_string_literal: true

class Lottery < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :prizes,
                                allow_destroy: true,
                                reject_if: :all_blank
  validates :prizes, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validate :deadline_later_than_today
  validates_associated :prizes
  scope :closed_yesterday, -> { where('deadline = ?', Time.zone.yesterday) }

  def self.execute
    closed_yesterday.each(&:notify_winners)
  end

  def notify_winners
    winning_entries = draw_lottery
    winning_entries.each { |winning_entry| send_winning_email(winning_entry) }
  end

  private

  def draw_lottery
    entry_list = entries.to_a
    prizes.flat_map { |prize| sample_randomly(entry_list, prize) }
  end

  def send_winning_email(winning_entry)
    WinMailer.with(
      to: winning_entry.email,
      name: winning_entry.email,
      subject: qualified_email_subject(winning_entry.prize),
      body: winning_entry.prize.winning_email_body
    ).win.deliver_now
  end

  def sample_randomly(entry_list, prize)
    winners = entry_list.select { |entry| entry.prize.nil? }.sample(prize.winners_count)
    set_winning_entry_prize(winners, prize)
  end

  def set_winning_entry_prize(winning_entries, prize)
    winning_entries.each { |winning_entry| winning_entry.update(prize:) }
  end

  def qualified_email_subject(prize)
    "[SmartLottery]#{prize.winning_email_subject}"
  end

  def deadline_later_than_today
    return unless deadline < Time.zone.today

    errors.add(:deadline, 'は本日以降を指定してください')
  end
end
