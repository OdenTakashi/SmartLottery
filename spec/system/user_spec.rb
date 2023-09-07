# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :system do
  it 'user can login' do
    visit welcome_path
    expect(page).to have_content 'あなたの抽選会をもっとラクに'
  end
end
