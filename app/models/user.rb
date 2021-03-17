class User < ApplicationRecord
  has_many :orders

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def is_clerk?
    clerk = role == "clerk" ? true : false
  end

  def is_owner?
    owner = role == "owner" ? true : false
  end
end
