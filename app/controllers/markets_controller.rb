class MarketsController < ApplicationController

  def index
  end
  
  def new
  end

  def create
  end

  def show
  end
 private

 def market_params
  params.require(:market).permit(:image,:name,:item_text,:category_id,:item_status,:delivery_id,:area_id,:days_to_ship_id,:price,:user).merge(user_id: current_user.id)
end
