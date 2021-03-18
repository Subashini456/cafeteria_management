class OrderfoodsController < ApplicationController
  def create
    @order = current_order
    @orderfood = @order.orderfoods.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def destroy
    @order = current_order
    @orderfood = @order.orderfoods.find(params[:id])
    @orderfood.destroy
    @orderfood = current_order.orderfoods
    redirect_to new_card_path
  end

  def order_params
    params.require(:orderfood).permit(:menu_id, :quantity)
  end
end
