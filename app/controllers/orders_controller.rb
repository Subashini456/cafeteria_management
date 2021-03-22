class OrdersController < ApplicationController
  def index
  end

  def create
    Order.new(user_id: current_user.id, status: "Unplaced Order")
  end

  def show
    @order = Order.all
  end

  def update
    uporder = Order.find(params[:id])
    if uporder.status == "Unplaced Order"
      order_placed(uporder)
    elsif uporder.status == "Placed"
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
    uporder.status = "Placed"
    if uporder.save
      redirect_to new_card_path
    else
      flash[:error] = Order.errors.full_messages.join(", ")
      redirect_to new_card_path
    end
  end

  private

  def order_delivered(uporder)
    uporder.status = "Delivered"
    if uporder.save
      redirect_to new_allorder_path
    else
      flash[:error] = Order.errors.full_messages.join(", ")
      redirect_to new_allorder_path
    end
  end
end
