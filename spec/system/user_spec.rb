# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:email) { 'testuser@example.com' }
  let(:password) { 'testtest' }

  it 'user can login' do
    visit welcome_path

    click_button '新規登録'
    expect(page).to have_content '新規登録'

    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password

    click_on '登録する'

    expect(page).to have_current_path '/welcome'
    expect(page).to have_content '本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。'

    described_class.find_by(email: 'testuser@example.com').confirm

    visit new_user_session_path

    fill_in 'user_email', with: email
    fill_in 'user_password', with: password

    click_on 'ログイン'

    expect(page).to have_content 'ログインしました。'
  end

  context 'when user is unauthenticated' do
    it 'redirect welcome page' do
      visit lotteries_path

      expect(page).to have_current_path '/welcome'
    end
  end

  context 'when user is authenticated' do
    before do
      sign_in user
    end

    it 'can not access welcome page' do
      visit welcome_path

      expect(page).to have_current_path '/'
    end

    it 'can logout' do
      visit lotteries_path
      click_on 'ログアウト'

      expect(page).to have_content 'ログアウトしました。'
    end
  end
end
