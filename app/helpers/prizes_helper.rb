# frozen_string_literal: true

module PrizesHelper
  def winning_email_body
    <<~EMAIL_CONTENT
      当選おめでとうございます。

      発送などについての情報を以下のメールアドレスまで送信ください。
      owner@example.com
    EMAIL_CONTENT
  end
end
