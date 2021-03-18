class CardsController < ApplicationController
  def show
    @orderfoods = Orderfood.where(:order_id => current_order.id)
  end
end
