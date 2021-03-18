class OrdersController < ApplicationController
  def update
    id = params[:id]
    uporder = Order.find(id)
    uporder.status = "Placed"
    uporder.save!
    redirect_to new_card_path
  end

  def destroy
    id = params[:id]
    downorder = Order.find(id)
    downorder.destroy
    redirect_to new_allorder_path
  end
end
