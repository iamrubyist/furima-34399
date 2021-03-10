class BuyMarketsController < ApplicationController
  before_action :set_buy, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index
  def index
    @purchase = PurchaseForm.new
  end

  def create 
    @purchase = PurchaseForm.new(purchases_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  private

  def purchases_params
    params.require(:purchase_form).permit(:postal_code_id,:prefectures,:municipality,:address,:phone_number,:building_name,:market_id).merge(user_id: current_user.id, token: params[:token],market_id:params[:market_id])
  end

  def set_buy
    @market = Market.find(params[:market_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @market.price,
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end
  def move_to_index
    redirect_to root_path if current_user == @market.user || @market.buy_market
   end
end
