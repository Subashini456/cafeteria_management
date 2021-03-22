class OrdersController < ApplicationController
  def create
    Order.new(user_id: current_user.id, status: 0)
  end

  def show
    @order = Order.all
  end

  def update
    uporder = Order.find(params[:id])
    if uporder.status == 0
      order_placed(uporder)
    elsif uporder.status == 1
      order_delivered(uporder)
    end
  end

  def destroy
    downorder = Order.find(params[:id])
    downorder.destroy
    redirect_to new_allorder_path
  end

  private

  def order_placed(uporder)
    uporder.status = 1
    if uporder.save
      redirect_to new_card_path
    else
      flash[:error] = Order.errors.full_messages.join(", ")
      redirect_to new_card_path
    end
  end

  private

  def order_delivered(uporder)
    uporder.status = 2
    if uporder.save
      redirect_to new_allorder_path
    else
      flash[:error] = Order.errors.full_messages.join(", ")
      redirect_to new_allorder_path
    end
  end
end
