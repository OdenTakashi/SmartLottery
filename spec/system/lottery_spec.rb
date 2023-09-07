# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :system do
  let(:user) { create(:user) }

  it 'can create lottery' do
    sign_in user
    visit lotteries_path

    click_button '新規作成'

    fill_in 'lottery_deadline', with: '002023-09-07'
    check 'lottery_name_field_enabled'
    check 'lottery_note_field_enabled'
    fill_in 'lottery_prizes_attributes_0_name', with: '抽選会の賞品名'
    fill_in 'lottery_prizes_attributes_0_winners_count', with: 2
    fill_in 'lottery_prizes_attributes_0_winning_email_subject', with: 'おめでとうございます!'
    fill_in 'lottery_prizes_attributes_0_winning_email_body', with: 'おめでとうございます!'

    click_button '登録する'

    expect(page).to have_content('抽選会を作成しました。')
  end
end
