FactoryGirl.define do
  factory :squatter do
    trait :first do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
      location Faker::Address.postcode
    end
    
    trait :second do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
      location Faker::Address.postcode
    end
    
    trait :third do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
      location Faker::Address.postcode
    end
  end
end
