# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    lottery
    prize { nil }
    sequence(:email) { |i| "entry#{i}@example.com" }
    sequence(:name) { |i| "応募者#{i}" }
    sequence(:note) { |i| "備考#{i}" }
  end
end
