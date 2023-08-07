# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_out_path_for(_resource)
    welcome_path
  end
end
