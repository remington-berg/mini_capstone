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
end
