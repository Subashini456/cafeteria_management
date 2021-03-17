class CardsController < ApplicationController
  def show
    @orderfoods = current_order.orderfoods
  end
end
