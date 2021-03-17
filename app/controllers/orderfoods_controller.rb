class OrderfoodsController < ApplicationController
  def create
    @order = current_order
    @orderfood = @order.orderfoods.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def order_params
    params.require(:orderfood).permit(:menu_id, :quantity)
  end
end
