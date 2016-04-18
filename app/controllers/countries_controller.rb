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

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
