class AllordersController < ApplicationController
  def show
    @order = Order.all
  end
end
