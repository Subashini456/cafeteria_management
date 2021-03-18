class User < ApplicationRecord
  has_many :orders

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def is_clerk?
    clerk = role == "Clerk" ? true : false
  end

  def is_owner?
    owner = role == "Owner" ? true : false
  end

  def is_customer?
    owner = role == "Customer" ? true : false
  end
end
