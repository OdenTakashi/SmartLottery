# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user
      @lotteries = current_user.lotteries
      render 'lotteries/index'
    else
      render 'welcome/index'
    end
  end
end
