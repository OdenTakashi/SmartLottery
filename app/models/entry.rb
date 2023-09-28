# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :lottery
  belongs_to :prize, optional: true
  validates :email, presence: true
  validates :name, presence: true, if: -> { lottery.name_field_enabled }
  after_update :send_winning_email

  def update_prize(prize)
    update!(prize:)
  end

  private

  def send_winning_email
    WinMailer.with(to: email, name: email, subject: qualified_email_subject(prize), body: prize.winning_email_body).win.deliver_now
  end

  def qualified_email_subject(prize)
    "[SmartLottery]#{prize.winning_email_subject}"
  end
end
