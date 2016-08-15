FactoryGirl.define do
  factory :squatter do
    trait :first do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
    end
    
    trait :second do
      username Faker::Internet.user_name
      email Faker::Internet.email
      password "password"
      password_confirmation "password"
    end
  end
end
