# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :system do
  let(:lottery) { create(:lottery) }

  it 'entry closed' do
    visit new_lottery_entry_path(lottery)

    expect(page).to have_content('本抽選会は終了しました。')
  end
end
