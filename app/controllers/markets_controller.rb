class MarketsController < ApplicationController
  before_action :set_market, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @markets = Market.all.order(created_at: :desc)
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

  def edit
  end

  def update
    if @market.update(market_params)
      redirect_to market_path(@market)
    else
      render :edit
    end
  end

  def show
    @market = Market.find(params[:id])
  end

  def destroy
    if @market.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
 private

 def market_params
  params.require(:market).permit(:image,:name,:item_text,:category_id,:item_status_id,:delivery_id,:area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
 end

 def set_market
  @market = Market.find(params[:id])
 end

 def move_to_index
  redirect_to root_path unless current_user == @market.user
 end

end
