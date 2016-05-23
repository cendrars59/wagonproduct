class CountriesController < ApplicationController

  # Retrieveing country according the ID
  before_action :find_country, only: [:show, :edit, :update, :destroy]
  before_action :find_master, only:[:show,:new,:create,:edit]
  before_action :get_countries, only:[:index]

  def index
    @countries = Country.all
    @countries = @countries.active if params[:active]
    @countries = @countries.master if params[:master]
    @countries = @countries.search(params[:search]) if params[:search]
  end

  def show
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
    if @country.update(country_params)
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_path
  end


  private

  # Avoid paramters hacking
  def country_params
    params.require(:country).permit(:code,:label,:active,:description,:photo,:country_id,:master)
  end

  def find_country
    @country = Country.find(params[:id])
  end

  def find_countries
    @countries = Country.all.find(params[:id])
  end

  def find_master
    @master = Country.master
  end

  def get_countries 
    @selectable_countries = Country.all
  end 


end
