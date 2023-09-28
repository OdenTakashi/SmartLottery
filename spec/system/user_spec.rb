# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:user_assined_email) { create(:user, email: 'notchangeduser@examople.com') }
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

  context 'when user email is assigned' do
    before do
      sign_in user_assined_email
    end

    it 'can edit prifile' do
      visit edit_user_registration_path
      expect(page).to have_field 'Eメール', with: 'notchangeduser@examople.com'

      fill_in 'user_email', with: 'changeduser@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      fill_in 'user_current_password', with: 'testtest'
      click_on '更新'

      expect(page).to have_content 'アカウント情報を変更しました。変更されたメールアドレスの本人確認のため、本人確認用メールより確認処理をおこなってください。'

      described_class.find_by(email: 'notchangeduser@examople.com').confirm

      visit edit_user_registration_path
      expect(page).to have_field 'Eメール', with: 'changeduser@example.com'
    end
  end
end
