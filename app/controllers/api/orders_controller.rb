class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      calculated_subtotal = product.price * params[:quantity].to_i
      calculated_tax = calculated_subtotal * 0.09
      calculated_total = calculated_subtotal + calculated_tax
      @order = Order.new({
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      })
      @order.save

      render "show.json.jb"
    else
      render json: ["nope."], status: :unauthorized
    end
  end

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render "show.json.jb"
    end
  end
end
