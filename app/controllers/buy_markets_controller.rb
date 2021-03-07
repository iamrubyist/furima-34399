class BuyMarketsController < ApplicationController

  def index
    @purchase = PurchaseForm.new
    @market = Market.find(params[:market_id])
  end

  def new
  end

  def create 
# binding.pry
    @market = Market.find(params[:market_id])
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
end
