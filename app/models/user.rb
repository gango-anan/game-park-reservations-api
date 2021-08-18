class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, presence: true, in: 8..20
end
