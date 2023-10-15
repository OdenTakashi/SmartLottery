# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :lottery
  belongs_to :prize, optional: true
  validates :email, presence: true
  validates :name, presence: true, if: -> { lottery.name_field_enabled }
end
