FactoryGirl.define do
  factory :abode_review do
    abode { create(:abode, :approved) }
    squatter { create(:squatter, :first) }
    summary Faker::Lorem.sentence
    body Faker::Lorem.paragraph
  end
end
