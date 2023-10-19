# frozen_string_literal: true

class LotteriesController < ApplicationController
  before_action :set_lottery, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /lotteries or /lotteries.json
  def index
    @lotteries = current_user.lotteries
  end

  # GET /lotteries/1 or /lotteries/1.json
  def show; end

  # GET /lotteries/new
  def new
    @lottery = Lottery.new
    @lottery.prizes.build
  end

  # GET /lotteries/1/edit
  def edit; end

  # POST /lotteries or /lotteries.json
  def create
    @lottery = Lottery.new(lottery_params)
    @lottery.user = current_user

    if @lottery.save
      redirect_to lottery_url(@lottery), notice: '抽選会を作成しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lotteries/1 or /lotteries/1.json
  def update
    if @lottery.update(lottery_params)
      redirect_to lottery_url(@lottery), notice: '抽選会を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lotteries/1 or /lotteries/1.json
  def destroy
    @lottery.destroy
    redirect_to lotteries_url, notice: '抽選会を削除しました。'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lottery
    @lottery = Lottery.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lottery_params
    params.require(:lottery).permit(:user_id, :name, :name_field_enabled, :note_field_enabled, :deadline,
                                    prizes_attributes: %i[id name winners_count winning_email_subject winning_email_body _destroy])
  end
end
