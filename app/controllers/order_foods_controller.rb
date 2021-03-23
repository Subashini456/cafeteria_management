class OrderFoodsController < ApplicationController
  def create
    @order = current_order
    @order_food = @order.order_foods.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def show
    @order_foods = OrderFood.where(:order_id => current_order.id)
  end

  def destroy
    order_food = current_order.order_foods.find(params[:id])
    order_food.destroy
    redirect_to new_card_path
  end

  private

  def order_params
    params.require(:order_food).permit(:menu_id, :quantity)
  end
end
