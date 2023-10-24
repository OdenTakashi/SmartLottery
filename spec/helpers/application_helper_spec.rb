# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#not_entry_form?' do
    def controller_path
      'entries'
    end

    it 'return false' do
      expect(not_entry_form?).to eq false
    end
  end
end
