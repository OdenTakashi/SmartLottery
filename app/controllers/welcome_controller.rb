# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect_to root_path if user_signed_in?
  end

  def about_anonymous_deliver; end
end
