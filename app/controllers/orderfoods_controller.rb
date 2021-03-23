class OrderfoodsController < ApplicationController
  def create
    @order = current_order
    @orderfood = @order.orderfoods.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def show
    @orderfoods = Orderfood.where(:order_id => current_order.id)
  end

  def destroy
    orderfood = current_order.orderfoods.find(params[:id])
    orderfood.destroy
    redirect_to new_card_path
  end

  private

  def order_params
    params.require(:orderfood).permit(:menu_id, :quantity)
  end
end
