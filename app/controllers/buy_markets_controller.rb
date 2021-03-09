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
    params.require(:purchase_form).permit(:postal_code_id,:prefectures,:municipality,:address,:phone_number,:building_name,:market_id).merge(user_id: current_user.id, token: params[:token])
  end

  def set_buy
    @purchase = PurchaseForm.new
    @market = Market.find(params[:market_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_0f8d56f8f32156056d6480db" 
    Payjp::Charge.create(
      amount: purchases_params[:price],
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end
end
