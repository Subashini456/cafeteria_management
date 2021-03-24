class Order < ApplicationRecord
  belongs_to :user
  has_many :order_foods

  before_save :set_total
  before_save :set_total_order

  def total
    order_foods.collect { |order_food| order_food.valid? ? order_food.unit_price * order_food.quantity : 0 }.sum
  end

  def total_order
    order_foods.collect { |order_food| order_food.id }.count
  end

  private

  def set_total
    self[:total] = total
  end

  private

  def set_total_order
    self[:total_order] = total_order
  end
end
