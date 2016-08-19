FactoryGirl.define do
  factory :abode_image do
    trait :first do
      file_name "1.jpg"
    end

    trait :second do
      file_name "2.jpg"
    end
  end
end
