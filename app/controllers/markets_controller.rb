class MarketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @markets = Market.order("created_at DESC")
  end
  
  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
 private

 def market_params
  params.require(:market).permit(:image,:name,:item_text,:category_id,:item_status_id,:delivery_id,:area_id,:days_to_ship_id,:price,:user).merge(user_id: current_user.id)
 end
end
