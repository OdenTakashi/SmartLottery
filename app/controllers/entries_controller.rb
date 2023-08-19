# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]
  before_action :set_lottery, only: %i[index new create show edit update destroy]

  # GET /entries or /entries.jsonå
  def index
    @entries = Entry.all
  end

  # GET /entries/1 or /entries/1.json
  def show; end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit; end

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

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to lottery_entry_path(@lottery, @entry), notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to lottery_entries_path(@lottery), notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  def set_lottery
    @lottery = Lottery.find(params[:lottery_id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:email, :name, :note)
  end
end
