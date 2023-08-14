# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :lottery
  belongs_to :prize, optional: true
  after_update :send_winning_email

  def update_prize(prize)
    update!(prize:)
  end

  private

  def send_winning_email
    WinMailer.with(to: email, name: email, subject: prize.winning_email_subject, body: prize.winning_email_body).win.deliver_later
  end
end
