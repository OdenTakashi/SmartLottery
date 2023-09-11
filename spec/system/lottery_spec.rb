# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :system do
  let(:user) { create(:user) }
  let(:lottery) { create(:lottery, user:) }

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
    expect(page).to have_content('2023年09月07日(木) 23:59')
  end

  it 'can delete lottery' do
    sign_in user
    visit lottery_path(lottery)

    click_button '削除'

    expect(page).to have_content('抽選会を削除しました。')
  end

  it 'can edit lottery' do
    sign_in user
    visit lottery_path(lottery)
    expect(page).to have_content('2023年08月06日(日) 23:59')

    click_button '編集する'

    fill_in 'lottery_deadline', with: '002023-09-13'

    click_button '更新する'

    expect(page).to have_content('抽選会を更新しました。')
    expect(page).to have_content('2023年09月13日(水) 23:59')
  end
end
