class NationalsController < ApplicationController
  before_action :find_national, only: [:show,:edit, :update, :destroy]

  # Gathering active retailers to create or update
  before_action :find_selectable_retailers, only: [:new, :edit]

  def index
    @nationals = National.all
    @nationals = @nationals.active if params[:active]
    @nationals = @nationals.search(params[:search]) if params[:search]
  end

  def show
  end

  def new
    @national = National.new
  end

  def create
    @national = National.new(national_params)
    if @national.save
      redirect_to nationals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @national.update(national_params)
      redirect_to nationals_path
    else
      render :edit
    end
  end

  def destroy
    @national.destroy
    redirect_to nationals_path
  end


  private

  # Avoid paramters hacking
  def national_params
    params.require(:national).permit(:code,:label,:active,:description,:retailer_id)
  end

  def find_national
    @national = National.find(params[:id])
  end

  def find_selectable_retailers
  	@selectable_retailers = Retailer.all
  end 

end
