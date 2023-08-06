# frozen_string_literal: true

FactoryBot.define do
  factory :lottery do
    name_field_enabled { false }
    note_field_enabled { false }
    deadline { '2023-08-06' }
  end
end
