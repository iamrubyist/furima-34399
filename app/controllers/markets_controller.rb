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
  params.require(:market).permit(:image,:name,:item_status,:price,:user).merge(user_id: current_user.id)
 end
end
