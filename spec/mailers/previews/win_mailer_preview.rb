# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/win_mailer
class WinMailerPreview < ActionMailer::Preview
  def win
    WinMailer.with(to: 'test@example.com', name: 'test').win
  end
end
