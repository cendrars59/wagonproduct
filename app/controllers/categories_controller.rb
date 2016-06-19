class CategoriesController < ApplicationController

  before_action :find_category, only: [:show,:edit,:update, :destroy]
  before_action :find_masters, only: [:show,:new,:create,:edit]

  # Gathering active countries and not master to attach to category to create or update
  before_action :find_active_countries_not_master, only: [:new, :edit]

  def index
    @categories = Category.all.ordered
    @categories = @categories.active.ordered if params[:active]
    @categories = @categories.master.ordered if params[:master]
    @categories = @categories.search(params[:search]).ordered if params[:search]
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end


  private

  # Avoid paramters hacking
  def category_params
    params.require(:category).permit(:code,:label,:active,:description,:country_id,:category_id,:master,:photo)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def find_active_countries_not_master
    @selectable_countries = Country.notMasterAndActive
  end

  def find_masters
    @masters = Category.master
  end 

  

end
