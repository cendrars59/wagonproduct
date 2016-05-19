class RetailersController < ApplicationController

  before_action :find_retailer, only: [:show,:edit,:update,:destroy]
 
  # Gathering active countries and not master to attach to retailer to create or update
  before_action :find_active_countries_not_master, only: [:new, :edit]

  def index
    @retailers = Retailer.all
    @retailers = @retailers.active if params[:active]
    @retailers = @retailers.search(params[:search]) if params[:search]
  end

  def show
  end

  def new
    @retailer = Retailer.new
  end

  def create
    @retailer = Retailer.new(retailer_params)
    if @retailer.save
      redirect_to retailers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @retailer.update(retailer_params)
      redirect_to retailers_path
    else
      render :edit
    end
  end

  def destroy
    @retailer.destroy
    redirect_to retailers_path
  end


  private

  # Avoid paramters hacking
  def retailer_params
    params.require(:retailer).permit(:code,:label, :active,:description,:country_id,:photo)
  end

  def find_retailer
    @retailer = Retailer.find(params[:id])
  end

  def find_active_countries_not_master
    @selectable_countries = Country.notMasterAndActive
  end

  
end
