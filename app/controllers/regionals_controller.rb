class RegionalsController < ApplicationController
	before_action :find_regional, only: [:show,:edit, :update, :destroy]

  # Gathering active retailers to create or update
  before_action :find_selectable_nationals, only: [:new, :edit]

  def index
    @regionals = Regional.all
    @regionals = @regionals.active if params[:active]
    @regionals = @regionals.search(params[:search]) if params[:search]
  end

  def show
  end

  def new
    @regional = Regional.new
  end

  def create
    @regional = Regional.new(regional_params)
    if @regional.save
      redirect_to regionals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @regional.update(regional_params)
      redirect_to regionals_path
    else
      render :edit
    end
  end

  def destroy
    @regional.destroy
    redirect_to regionals_path
  end


  private

  # Avoid paramters hacking
  def regional_params
    params.require(:regional).permit(:code,:label,:active,:description,:retailer_id)
  end

  def find_regional
    @regional = Regional.find(params[:id])
  end

  def find_selectable_nationals
  	@selectable_nationals = National.all
  end 
	
end
