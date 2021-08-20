class Activity < ApplicationRecord
  validates :title, :image_url, :details, :park, presence: true
  
  has_many :reservations
  has_many :users, through: :reservations
end
