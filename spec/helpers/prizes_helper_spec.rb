# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PrizesHelper, type: :helper do
  it 'winning_message_template' do
    expect(winning_message_template).to eq "当選おめでとうございます。\n\n発送などについての情報を以下のメールアドレスまで送信ください。\n\nowner@example.com\n\n"
  end
end
