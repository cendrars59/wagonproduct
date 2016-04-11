class ProductsController < ApplicationController

  PRODUCTS = [
    {name: "product1" , category: "cat1"},
    {name: "product2" , category: "cat1"},
    {name: "product3" , category: "cat2"},
    {name: "product4" , category: "cat2"},
    {name: "product5" , category: "cat3"}
  ]

  def index
    if params[:filter]
      @products= PRODUCTS.select {|product| product[:category] == params[:filter]}
    else
      @products = PRODUCTS
    end
  end

  def show
    @product = PRODUCTS[params[:id]]
  end

end
