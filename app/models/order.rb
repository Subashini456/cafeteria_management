class Order < ApplicationRecord
  belongs_to :user
  has_many :orderfoods

  before_save :set_total

  def total
    orderfoods.collect { |orderfood| orderfood.valid? ? orderfood.unit_price * orderfood.quantity : 0 }.sum
  end

  def set_total
    self[:total] = total
  end
end
