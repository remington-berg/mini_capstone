# class Api::OrdersController < ApplicationController
#   def create
#     @order = Order.create({
#       user_id: current_user.id,
#       product_id: params[:product_id],
#       quantity: params[:quantity],
#       subtotal: params[:subtotal],
#       tax: params[:tax],
#       total: params[:total],
#     })
#     @order.save
#     render "show.json.jb"
#   end
# end
