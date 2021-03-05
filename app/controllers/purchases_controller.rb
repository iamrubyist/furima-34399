class PurchasesController < ApplicationController
  def index
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
    end
  end

  private
  def purchase_params
    params.permit(:postal_code_id,:prefectures,:municipality,:address,:phone_number,:buy_market).merge(user_id: current_user.id)
end
