# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :system, js: true do
  let(:closed_lottery) { create(:lottery, :skip_validate, deadline: Time.zone.yesterday) }
  let(:opend_lottery) { create(:lottery, deadline: Time.zone.tomorrow) }
  let(:lotetery_have_note_form_only) { create(:lottery, name_field_enabled: false, deadline: Time.zone.tomorrow) }
  let(:lotetery_have_name_form_only) { create(:lottery, note_field_enabled: false, deadline: Time.zone.tomorrow) }
  let(:lotetery_have_email_form_only) { create(:lottery, note_field_enabled: false, name_field_enabled: false,  deadline: Time.zone.tomorrow) }

  context 'when lottery is not held' do
    it 'display closed message' do
      visit new_lottery_entry_path(closed_lottery)
  
      expect(page).to have_content('本抽選会は終了しました。')
    end
  end

  context 'when lottery is held' do
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

  context 'lottery have note form only' do
    it 'have no name form ' do
      visit new_lottery_entry_path(lotetery_have_note_form_only)

      expect(page).to have_selector "#entry_note"
      expect(page).not_to have_selector "#entry_name"
    end
  end

  context 'lottery have name form only' do
    it 'have no name form ' do
      visit new_lottery_entry_path(lotetery_have_name_form_only)

      expect(page).to have_selector "#entry_name"
      expect(page).not_to have_selector "#entry_note"
    end
  end

  context 'lottery have email form only' do
    it 'have no name form ' do
      visit new_lottery_entry_path(lotetery_have_email_form_only)

      expect(page).to have_selector "#entry_email"
      expect(page).not_to have_selector "#entry_name"
      expect(page).not_to have_selector "#entry_note"
    end
  end
end
