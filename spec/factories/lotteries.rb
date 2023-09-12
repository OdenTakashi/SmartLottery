# frozen_string_literal: true

FactoryBot.define do
  factory :lottery do
    user
    name_field_enabled { true }
    note_field_enabled { true }
    deadline { '2023-08-06' }

    after(:build) do |lottery|
      lottery.prizes << build(:prize, lottery:)
      lottery.entries << build_list(:entry, 5, lottery:)
    end
  end
end
