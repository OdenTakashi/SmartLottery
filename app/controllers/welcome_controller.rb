# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect_to lotteries_path if current_user
  end

  def terms; end

  def privacy_policy; end
end
