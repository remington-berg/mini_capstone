class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    user_input = params["id"]
    @product = Product.find_by(id: user_input.to_i)
    render "show.json.jb"
  end

  def create
    @product = Product.create({
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    })
    render "show.json.jb"
  end
end
