# frozen_string_literal: true

FactoryBot.define do
  factory :prize do
    name { 'MyString' }
    winners_count { 1 }
    winning_email_subject { 'MyString' }
    winning_email_body { 'MyString' }
  end
end
