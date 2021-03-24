class OrderFoodsController < ApplicationController
  def create
    order = current_order
    @order_food = order.order_foods.new(order_params)
    order.save
    session[:order_id] = order.id
    check_create_condition(order)
  end

  def show
    @order_foods = OrderFood.where(:order_id => current_order.id)
  end

  def update
    up_order = OrderFood.find(params[:id])
    up_order.update(update_params)
    check_save_condition(up_order)
  end

  def destroy
    order_food = current_order.order_foods.find(params[:id])
    order_food.destroy
    redirect_to new_card_path
  end

  private

  def update_params
    params.permit(:quantity)
  end

  private

  def order_params
    params.require(:order_food).permit(:menu_id, :quantity)
  end

  private

  def check_save_condition(up_order)
    if up_order.save
      redirect_to new_card_path
    else
      flash[:error] = menu.errors.full_messages.join(", ")
      redirect_to new_card_path
    end
  end

  def check_create_condition(order)
    if order.save
      flash[:notice] = "menu saved successfully"
      redirect_to menus_path
    else
      flash[:error] = order.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end
end
