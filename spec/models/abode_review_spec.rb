require 'rails_helper'

RSpec.describe AbodeReview, type: :model do

  it "should create a new review with valid attributes" do
    review = FactoryGirl.build(:abode_review)
    expect(review).to be_valid
  end

  describe "summary" do
    it "should be not exceed 140 characters" do
      review = FactoryGirl.build(:abode_review, summary: "s"*141)
      expect(review).to_not be_valid
    end
  end
  
  describe "body" do
    it "should be present" do
      review = FactoryGirl.build(:abode_review, body: "")
      expect(review).to_not be_valid
    end
  end
  
  describe "associations" do
    it "should belong to an abode" do
      review = FactoryGirl.build(:abode_review, abode: nil)
      expect(review).to_not be_valid
    end
    
    it "should belong to a squatter" do
      review = FactoryGirl.build(:abode_review, squatter: nil)
      expect(review).to_not be_valid
    end
  end
end
