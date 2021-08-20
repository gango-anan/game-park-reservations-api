require 'faker'

FactoryBot.define do
  factory :reservation do
    user
    activity
  end
end