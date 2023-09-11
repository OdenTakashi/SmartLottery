# frozen_string_literal: true

FactoryBot.define do
  factory :prize do
    name { 'テストの賞品' }
    winners_count { 1 }
    winning_email_subject { 'おめでとうございます' }
    winning_email_body { 'おめでとうございます' }
  end
end
