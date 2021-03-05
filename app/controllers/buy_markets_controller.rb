class BuyMarketsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @buy_market = BuyMarket.create(buy_market_params)
    @purchase = Purchase.create(purchases_params)
    redirect_to root_path
  end

  private

  def buy_market_params
    params.permit().merge(user_id: current_user.id)
  end

  def purchases_params
    params.permit(:postal_code_id,:prefectures,:municipality,:address,:phone_number,:buy_market).merge(user_id: current_user.id)
  end
end
