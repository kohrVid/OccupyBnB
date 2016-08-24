FactoryGirl.define do
  factory :message do
    title Faker::Lorem.words.join(" ")
    body Faker::Lorem.paragraph
    visible true
  end
end
