# frozen_string_literal: true

FactoryBot.define do
  factory :lottery do
    user
    name_field_enabled { false }
    note_field_enabled { false }
    deadline { '2023-08-06' }

    after(:build) do |lottery|
      lottery.prizes << build(:prize, lottery:)
    end
  end
end
