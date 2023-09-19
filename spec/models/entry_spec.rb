# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'validation' do
    let(:user) { create(:user) }
    let(:lottery) { create(:lottery, user:) }

    it 'is invalid without name' do
      invalid_entry = build(:entry, lottery:, name: nil)
      invalid_entry.valid?
      expect(invalid_entry.errors[:name]).to include('を入力してください')
    end
  end
end
