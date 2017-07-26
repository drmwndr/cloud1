
class OrderItemsController < ApplicationController
  def create
  	@order = current_order
  	@order_item = @order.order_items.new(params[:order_items])
  	@order.save
  	session[:order_id] = @order.id
  end

  def update
  	@order = current_order
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.update_attributes(params[:order_item])
  	@order_items = @order.order_items
  end

  def destroy
  	@order = current_order
  	@order_item = @order.order_items.find(params[:id])
  	@order_item.destroy
  	@order_items = @order.order_items
  end
end
