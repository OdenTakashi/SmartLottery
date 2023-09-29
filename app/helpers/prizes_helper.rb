# frozen_string_literal: true

module PrizesHelper
  def winning_message_template
    <<~EMAIL_CONTENT
      当選おめでとうございます。

      発送などについての情報を以下のメールアドレスまで送信ください。
      匿名発送希望の方は以下のメールアドレスまでその旨を送信ください。
      owner@example.com

    EMAIL_CONTENT
  end
end
