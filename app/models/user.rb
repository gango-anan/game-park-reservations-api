class User < ApplicationRecord
  validates :username, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
end
