class OrderFood < ApplicationRecord
  belongs_to :menu
  belongs_to :order

  def unit_price
    menu.price
  end

  def subtotal
    unit_price * quantity
  end
end
