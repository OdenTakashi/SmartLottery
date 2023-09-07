# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testuser1@example.com' }
    password { 'testtest' }
    confirmed_at { Time.current }
  end
end
