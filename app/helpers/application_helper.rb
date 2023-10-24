# frozen_string_literal: true

module ApplicationHelper
  def not_entry_form?
    controller_path != 'entries'
  end
end
