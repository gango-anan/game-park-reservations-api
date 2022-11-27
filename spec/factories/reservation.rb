require 'faker'

FactoryBot.define do
  factory :reservation do
    reservation_date { Faker::Date.in_date_period }
    user
    activity
  end
end
