class Api::ProductsController < ApplicationController
  def display_products
    @products = Product.all
    render "all.json.jb"
  end

  def quinn
    @product = Product.first
    render "quinn.json.jb"
  end

  def culkin
    @product = Product.second
    render "culkin.json.jb"
  end

  def jackson
    @product = Product.third
    render "jackson.json.jb"
  end

  def single
    user_input = params["id"]
    @product = Product.find_by(id: user_input.to_i)
    render "single.json.jb"
  end
end
