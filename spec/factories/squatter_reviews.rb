FactoryGirl.define do
  factory :squatter_review do
    reviewee { create(:squatter, :first) }
    reviewer { create(:squatter, :second) }
    summary Faker::Lorem.sentence
    body Faker::Lorem.paragraph
  end
end
