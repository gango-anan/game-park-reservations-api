class Activity < ApplicationRecord
  belongs_to :user
  validates :title, :image_url, :details, :park, presence: true
end
