class Menu < ActiveRecord::Base
  has_many :order_foods
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :menu_category, presence: true

  def self.breakfast
    all.where(:menu_category => "Breakfast")
  end

  def self.lunch
    all.where(:menu_category => "Lunch")
  end

  def self.dinner
    all.where(:menu_category => "Dinner")
  end

  def self.beverages
    all.where(:menu_category => "Beverages")
  end

  def self.snacks
    all.where(:menu_category => "Snacks")
  end
end
