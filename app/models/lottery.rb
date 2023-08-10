# frozen_string_literal: true

class Lottery < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy
  accepts_nested_attributes_for :prizes,
                                allow_destroy: true,
                                reject_if: :all_blank
end
