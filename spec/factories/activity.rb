require 'faker'

FactoryBot.define do
  factory :activity do
    title { Faker::App.name }
    park { Faker::App.name }
    image_url { Faker::App.name }
    details { Faker::App.name }
  end
end