FactoryGirl.define do
  factory :abode do
    trait :approved do
      title Faker::Lorem.words.join(" ")
      description Faker::Lorem.paragraph
      location Faker::Address.postcode
      residential false
      approved true
    end    
    trait :unapproved do
      title Faker::Lorem.words.join(" ")
      description Faker::Lorem.paragraph
      location Faker::Address.postcode
      residential false
      approved false
    end    
  end
end
