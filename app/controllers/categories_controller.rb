class CategoriesController < ApplicationController

  before_action :find_category, only: [:show, :edit, :update, :destroy]
  before_action :gather_country, only: [:new, :edit]

  def index
    @categories = Category.all
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
    params.require(:category).permit(:code, :label, :active)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def gather_country
    @selectable_countries = Country.active
  end

end
