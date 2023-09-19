# frozen_string_literal: true

FactoryBot.define do
  factory :lottery do
    user
    name_field_enabled { true }
    note_field_enabled { true }
    deadline { Time.zone.tomorrow }

    after(:build) do |lottery|
      lottery.prizes << build_list(:prize, 3, lottery:)
      lottery.entries << build_list(:entry, 5, lottery:)
    end
  end
end
