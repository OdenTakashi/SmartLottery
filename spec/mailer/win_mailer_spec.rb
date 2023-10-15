# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WinMailer, type: :mailer do
  describe '#win' do
    subject(:mail) do
      described_class.with(
        to: winning_entry.email,
        name: winning_entry.email,
        subject: qualified_email_subject(winning_entry.prize),
        body: winning_entry.prize.winning_email_body
      ).win.deliver
      ActionMailer::Base.deliveries.last
    end

    let!(:lottery) { create(:lottery) }
    let!(:prize) { create(:prize, winning_email_subject: 'テストの件名', winning_email_body: 'テストの本文', lottery:) }
    let!(:winning_entry) { create(:entry, email: 'test@example.com', lottery:, prize:) }

    def qualified_email_subject(prize)
      "[SmartLottery]#{prize.winning_email_subject}"
    end

    it 'send to email address of winning entry' do
      expect(mail.to).to eq ['test@example.com']
    end

    it 'send with correct subject' do
      expect(mail.subject).to eq '[SmartLottery]テストの件名'
    end

    it 'send with correct winning_email_body' do
      expect(mail.html_part.body.to_s).to match(/test@example.com様/)
      expect(mail.html_part.body.to_s).to match(/テストの本文/)
      expect(mail.html_part.body.to_s).to match(%r{※ 本メールは送信専用のメールアドレスで送信しております。<br />本メールに返信いただいてもご回答いたしかねますので、あらかじめご了承ください})
    end
  end
end
