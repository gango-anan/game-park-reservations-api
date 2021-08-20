class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :reservation_date, presence: true
end
