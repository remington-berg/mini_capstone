class Api::ProductsController < ApplicationController
  def display_products
    @products = Product.all
    render "all.json.jb"
  end
end
