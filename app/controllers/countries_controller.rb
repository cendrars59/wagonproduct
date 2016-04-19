class CountriesController < ApplicationController
  def index
    @countries= Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  # Avoid paramters hacking
  def country_params
    params.require(:country).permit(:code, :label, :active)
  end

end
