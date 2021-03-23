class Order < ApplicationRecord
  belongs_to :user
  has_many :order_foods

  before_save :set_total

  def total
    order_foods.collect { |order_food| order_food.valid? ? order_food.unit_price * order_food.quantity : 0 }.sum
  end

  private

  def set_total
    self[:total] = total
  end
end
