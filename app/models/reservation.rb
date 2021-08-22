class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :reservation_date, presence: true
  validates_uniqueness_of :activity, scope: :user_id, message: 'You have already reserved this activity'
end
