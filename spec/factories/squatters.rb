FactoryGirl.define do
  factory :squatter do
    trait :first do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
      location "London, E6 6ER"
    end
    
    trait :second do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
      location "37431-2175"
    end
    
    trait :third do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
      location "63618-0398"
    end
  end
end
