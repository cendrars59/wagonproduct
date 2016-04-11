class ProductsController < ApplicationController

  def index
    if params[:filter]
      @products= Product.select {|product| product[:category] == params[:filter]}
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
