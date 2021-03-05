class BuyMarketsController < ApplicationController

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
      render :new
    end
  end
  private

  def purchases_params
    params.permit(:postal_code_id,:prefectures,:municipality,:address,:phone_number,:buy_market).merge(user_id: current_user.id)
  end
end
