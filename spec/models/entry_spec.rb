# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'validation' do
    let(:lottery) { create(:lottery) }

    it 'is invalid without name' do
      invalid_entry = build(:entry, lottery:, name: nil)
      invalid_entry.valid?
      expect(invalid_entry.errors[:name]).to include('を入力してください')
    end
  end

  describe '#update_prize' do
    let(:lottery) { create(:lottery) }
    let(:entry) { create(:entry, lottery:) }
    let(:prize) { create(:prize, lottery:) }

    it 'update successful' do
      expect(entry.prize).to be_nil
      entry.update_prize(prize)
      expect(entry.prize).not_to be_nil
    end
  end
end
