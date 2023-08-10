# frozen_string_literal: true

class LotteriesController < ApplicationController
  before_action :set_lottery, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /lotteries or /lotteries.json
  def index
    if current_user
      @lotteries = current_user.lotteries
    else
      redirect_to welcome_path
    end
  end

  # GET /lotteries/1 or /lotteries/1.json
  def show; end

  # GET /lotteries/new
  def new
    @lottery = Lottery.new
  end

  # GET /lotteries/1/edit
  def edit; end

  # POST /lotteries or /lotteries.json
  def create
    @lottery = Lottery.new(lottery_params)
    @lottery.user = current_user

    respond_to do |format|
      if @lottery.save
        format.html { redirect_to lottery_url(@lottery), notice: 'Lottery was successfully created.' }
        format.json { render :show, status: :created, location: @lottery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lottery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lotteries/1 or /lotteries/1.json
  def update
    respond_to do |format|
      if @lottery.update(lottery_params)
        format.html { redirect_to lottery_url(@lottery), notice: 'Lottery was successfully updated.' }
        format.json { render :show, status: :ok, location: @lottery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lottery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lotteries/1 or /lotteries/1.json
  def destroy
    @lottery.destroy

    respond_to do |format|
      format.html { redirect_to lotteries_url, notice: 'Lottery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lottery
    @lottery = Lottery.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lottery_params
    params.require(:lottery).permit(:user_id, :name_field_enabled, :note_field_enabled, :deadline, prizes_attributes: [:id, :name, :winners_count, :winning_email_subject, :winning_email_body, :_destroy])
  end
end
