class AllordersController < ApplicationController
  def show
    @order = Order.all
  end

  def update
    id = params[:id]
    uporder = Order.find(id)
    uporder.status = "Delivered"
    uporder.save!
    redirect_to new_allorder_path
  end
end
