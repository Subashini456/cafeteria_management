class OrderFood < ApplicationRecord
  belongs_to :menu
  belongs_to :order

  before_save :set_unit_price
  before_save :set_subtotal

  def unit_price
    menu.price
  end

  def subtotal
    unit_price * quantity
  end

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
