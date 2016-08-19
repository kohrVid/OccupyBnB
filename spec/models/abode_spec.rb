require 'rails_helper'

RSpec.describe Abode, type: :model do
  it "should create a new abode with valid attributes" do
    abode = FactoryGirl.build(:abode, :unapproved)
    expect(abode).to be_valid
  end

  describe "title" do
    it "should be present" do
      abode = FactoryGirl.build(:abode, :unapproved, title: "")
      expect(abode).to_not be_valid
    end
    
    it "should be not exceed 30 characters" do
      abode = FactoryGirl.build(:abode, :unapproved, title: "t"*31)
      expect(abode).to_not be_valid
    end
  end
  
  describe "location" do
    it "should be present" do
      abode = FactoryGirl.build(:abode, :unapproved, location: "")
      expect(abode).to_not be_valid
    end
  end
  
  describe "associations" do
    it "should have a submitted_by ID" do
      abode = FactoryGirl.build(:abode, :unapproved, submitted_by: nil)
      expect(abode).to_not be_valid
    end
  end
end
