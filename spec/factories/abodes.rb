FactoryGirl.define do
  factory :abode do
    trait :approved do
      title "Less than 30 characters"
      description Faker::Lorem.paragraph
      location "32950-7123"
      residential false
      submitted_by { create(:squatter, :second) }
      sleeps_number 1
      approved true
    end    
    trait :unapproved do
      title "Still Less than 30 characters"
      description Faker::Lorem.paragraph
      location "77625-9206"
      residential false
      submitted_by { create(:squatter, :third) }
      sleeps_number 1
      approved false
    end    
  end
end
