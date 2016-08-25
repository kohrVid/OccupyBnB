require 'rails_helper'

RSpec.describe SquatterReview, type: :model do
  it "should create a new review with valid attributes" do
    review = FactoryGirl.build(:squatter_review)
    expect(review).to be_valid
  end

  describe "summary" do
    it "should be not exceed 140 characters" do
      review = FactoryGirl.build(:squatter_review, summary: "s"*141)
      expect(review).to_not be_valid
    end
  end
  
  describe "body" do
    it "should be present" do
      review = FactoryGirl.build(:squatter_review, body: "")
      expect(review).to_not be_valid
    end
  end
  
  describe "associations" do
    it "should belong to a reviewed squatter" do
      review = FactoryGirl.build(:squatter_review, reviewee: nil)
      expect(review).to_not be_valid
    end
    
    it "should belong to the squatter who wrote the review" do
      review = FactoryGirl.build(:squatter_review, reviewer: nil)
      expect(review).to_not be_valid
    end
  end
end
