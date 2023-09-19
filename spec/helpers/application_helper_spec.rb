# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  def controller_path
    'entries'
  end

  it 'entry_form?' do
    expect(entry_form?).to eq true
  end
end
