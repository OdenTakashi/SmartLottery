# frozen_string_literal: true

class Prize < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :lottery
  validates :name, presence: true
  validates :winners_count, presence: true
  validates :winning_email_subject, presence: true
  validates :winning_email_body, presence: true
  validate :winners_count_is_positive

  private

  def winners_count_is_positive
    return if winners_count.positive?

    lottery.errors.add(:prizes, 'は1以上を指定してください。')
  end
end
