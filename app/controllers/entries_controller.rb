# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :set_lottery, only: %i[new create]

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.lottery = @lottery
  
    if @entry.save
      render turbo_stream: turbo_stream.replace('entry_completed', partial: 'entry_completed')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_lottery
    @lottery = Lottery.find(params[:lottery_id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:email, :name, :note)
  end
end
