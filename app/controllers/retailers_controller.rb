class RetailersController < ApplicationController


  # Gathering active countries to attach to category to create or update
  before_action :gather_country, only: [:new, :edit]

  def index
    @retailers = Retailer.all
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
    params.require(:retailer).permit(:code, :label, :active, :description ,:country_id,:photo)
  end

  def gather_country
    @selectable_countries = Country.active
  end


end
