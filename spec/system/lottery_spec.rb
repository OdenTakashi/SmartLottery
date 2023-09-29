# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :system do
  let(:user) { create(:user) }
  let(:closed_lottery) { create(:lottery, :skip_validate, deadline: '2023-08-06', user:) }
  let(:lottery_executed) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday, user:) }

  describe 'can create open lottery' do
    before do
      travel_to Time.zone.local(2023, 9, 1)
    end

    it 'create lottery' do
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
  end

  it 'can delete lottery' do
    sign_in user
    visit lottery_path(closed_lottery)

    click_button '削除'

    expect(page).to have_content('抽選会を削除しました。')
  end

  describe 'open_lottery can edit lottery' do
    before do
      travel_to Time.zone.local(2023, 9, 1)
    end

    let(:open_lottery) { create(:lottery, deadline: Time.zone.tomorrow, user:) }

    it 'can edit' do
      sign_in user
      visit lottery_path(open_lottery)

      expect(page).to have_content('編集する')
      expect(page).to have_content('2023年09月02日(土) 23:59')

      click_on '編集する'
      fill_in 'lottery_deadline', with: '002023-09-13'
      click_button '更新する'

      expect(page).to have_content('抽選会を更新しました。')
      expect(page).to have_content('2023年09月13日(水) 23:59')
    end
  end

  describe 'can not set deadline_later_than_today' do
    before do
      travel_to Time.zone.local(2023, 9, 1)
    end

    it 'error occurs' do
      sign_in user
      visit lotteries_path

      click_button '新規作成'

      fill_in 'lottery_deadline', with: '002023-08-01'
      check 'lottery_name_field_enabled'
      check 'lottery_note_field_enabled'
      fill_in 'lottery_prizes_attributes_0_name', with: '抽選会の賞品名'
      fill_in 'lottery_prizes_attributes_0_winners_count', with: 2
      fill_in 'lottery_prizes_attributes_0_winning_email_subject', with: 'おめでとうございます!'
      fill_in 'lottery_prizes_attributes_0_winning_email_body', with: 'おめでとうございます!'

      click_button '登録する'

      expect(page).to have_content('締切日は本日以降を指定してください')
    end
  end

  it 'closed_lottery can not edit' do
    sign_in user
    visit lottery_path(closed_lottery)

    expect(page).not_to have_content('編集する')
    expect(page).to have_content('抽選会は終了しているため編集できません')
  end

  it 'dont display winners' do
    sign_in user
    visit lottery_path(closed_lottery)

    expect(page).not_to have_content('当選者欄')
  end

  it 'display winners' do
    lottery_executed.execute
    sign_in user
    visit lottery_path(lottery_executed)

    expect(page).to have_content('当選者欄')
  end
end
