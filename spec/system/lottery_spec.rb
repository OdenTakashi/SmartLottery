# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lottery, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:lottery) { create(:lottery, name: 'テストの抽選会', user:) }
  let(:closed_lottery) { create(:lottery, :skip_validate, deadline: '2023-08-06', user:) }

  context 'when lottery is nothing' do
    it 'display promotion word' do
      sign_in other_user
      visit lotteries_path

      expect(page).to have_content('早速企画している抽選会を作成してみましょう !')
    end
  end

  context 'when lottery has closed' do
    it 'can not edit' do
      sign_in user
      visit lottery_path(closed_lottery)

      expect(page).not_to have_content('編集する')
      expect(page).to have_content('抽選会は終了しているため編集できません')
    end
  end

  context 'when lottery has not been executed' do
    it 'dont display winners' do
      sign_in user
      visit lottery_path(closed_lottery)

      expect(page).not_to have_content('当選者欄')
    end
  end

  context 'when lottery has been executed' do
    let!(:lottery_executed) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday, user:) }

    it 'display winners' do
      described_class.execute
      sign_in user
      visit lottery_path(lottery_executed)

      expect(page).to have_content('当選者欄')
    end
  end

  it 'can delete lottery' do
    sign_in user
    visit lottery_path(closed_lottery)

    click_button '削除'

    expect(page).to have_content('抽選会を削除しました。')
  end

  context 'when travel to 2023-09-01' do
    before do
      travel_to Time.zone.local(2023, 9, 1)
    end

    context 'when deadline after today' do
      let(:open_lottery) { create(:lottery, deadline: Time.zone.tomorrow, user:) }

      it 'can create lottery' do
        sign_in user
        visit lotteries_path

        click_button '新規作成'

        fill_in 'lottery_name', with: 'テストの抽選会'
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

    context 'when deadline before today' do
      it 'can not create' do
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
  end

  context 'when click lottery name' do
    before do
      sign_in user
      visit lotteries_path
    end

    it 'exist specifid lottery name' do
      expect(page).to have_content('テストの抽選会')
    end

    it 'can accsess specified lottery' do
      click_on 'テストの抽選会'

      expect(page).to have_content('テストの抽選会')
      expect(page).to have_current_path "/lotteries/#{lottery.id}"
    end
  end
end
