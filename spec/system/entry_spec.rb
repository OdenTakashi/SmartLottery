# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :system, js: true do
  let(:closed_lottery) { create(:lottery, deadline: Time.zone.yesterday) }
  let(:opend_lottery) { create(:lottery, deadline: Time.zone.tomorrow) }

  it 'entry closed' do
    visit new_lottery_entry_path(closed_lottery)

    expect(page).to have_content('本抽選会は終了しました。')
  end

  it 'can entry' do
    visit new_lottery_entry_path(opend_lottery)

    expect(page).to have_content('新規応募')

    fill_in 'entry_email', with: 'entryuser@example.com'
    fill_in 'entry_name', with: '応募の名前'
    fill_in 'entry_note', with: '応募の備考'

    click_button '登録する'

    expect(page).to have_content('応募完了しました')
  end
end
