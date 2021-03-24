class Order < ApplicationRecord
  belongs_to :user
  has_many :order_foods

  def total
    order_foods.collect { |order_food| order_food.valid? ? order_food.unit_price * order_food.quantity : 0 }.sum
  end

  def total_order
    order_foods.collect { |order_food| order_food.id }.count
  end
end
