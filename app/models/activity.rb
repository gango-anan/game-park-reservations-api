class Activity < ApplicationRecord
  validates :title, :image_url, :details, :park, presence: true
  
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
end
