# frozen_string_literal: true

module ApplicationHelper
  def entry_form?
    controller_path == 'entries'
  end
end
