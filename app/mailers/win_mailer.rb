# frozen_string_literal: true

class WinMailer < ApplicationMailer
  def win
    @name = params[:name]
    @body = params[:body]
    mail(to: params[:to], subject: params[:subject])
  end
end
