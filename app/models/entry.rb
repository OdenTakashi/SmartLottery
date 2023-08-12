# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :lottery
  belongs_to :prize, optional: true
end
