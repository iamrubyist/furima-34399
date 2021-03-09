class BuyMarketsController < ApplicationController
  before_action :set_buy, only: [:index, :create]

  def index
  end

  def new
  end

  def create 
    @purchase_form = PurchaseForm.new(purchases_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
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
    @purchase = PurchaseForm.new
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
end
