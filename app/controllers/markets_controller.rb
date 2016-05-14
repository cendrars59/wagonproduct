class MarketsController < ApplicationController
	before_action :find_market, only: [:show, :edit, :update, :destroy]

  # Gathering active countries and not master to attach to market to create or update
  before_action :find_active_categories_not_master, only: [:new,:create,:update,:edit]

  def index
    @markets = Market.all
  end

  def show
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @market.update(market_params)
      redirect_to markets_path
    else
      render :edit
    end
  end

  def destroy
    @market.destroy
    redirect_to markets_path
  end


  private

  # Avoid paramters hacking
  def market_params
    params.require(:market).permit(:code,:label,:active,:description,:category_id,:photo)
  end

  def find_market
    @market = Market.find(params[:id])
  end

  def find_active_categories_not_master
      @selectable_categories = Category.notMasterAndActive
  end

end
