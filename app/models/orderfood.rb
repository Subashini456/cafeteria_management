class Orderfood < ApplicationRecord
  belongs_to :menu
  belongs_to :order

  before_save :set_subtotal
  before_save :set_unit_price

  def unit_price
    if persisted?
      self[:unit_price]
    else
      menu.price
    end
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
