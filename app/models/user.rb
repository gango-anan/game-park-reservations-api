class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, presence: true, length: { minimum: 8 }

  has_many :reservations
  has_many :activities, through: :reservations
end
