class BuyMarketsController < ApplicationController
  before_action :set_buy, only: [:index, :create]

  def index
  end

  def new
  end

  def create 
    @purchase_form = PurchaseForm.new(purchases_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end
  private

  def purchases_params
    params.permit(:postal_code_id,:prefectures,:municipality,:address,:phone_number,:building_name,:market_id).merge(user_id: current_user.id)
  end

  def set_buy
    @purchase = PurchaseForm.new
    @market = Market.find(params[:market_id])
  end

end
