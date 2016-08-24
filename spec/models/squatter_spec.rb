require 'rails_helper'

RSpec.describe Squatter, type: :model do
  it "should create a new squatter with valid attributes" do
    squatter = FactoryGirl.build(:squatter, :first)
    expect(squatter).to be_valid
  end

  describe "username" do
    it "should be present" do
      squatter = FactoryGirl.build(:squatter, :first, username: "")
      expect(squatter).to_not be_valid
    end

    it "should be unique" do
      squatter = FactoryGirl.create(:squatter, :first)
      squatter2 = FactoryGirl.build(:squatter, :second, username: squatter.username)
      expect(squatter2).to_not be_valid
    end
  end

  describe "email" do
    it "should be present" do
      squatter = FactoryGirl.build(:squatter, :first, email: "")
      expect(squatter).to_not be_valid
    end

    it "should be unique" do
      squatter = FactoryGirl.create(:squatter, :first)
      squatter2 = FactoryGirl.build(:squatter, :second, email: squatter.email)
      expect(squatter2).to_not be_valid
    end

    it "must be no more than 255 characters long" do
      squatter = FactoryGirl.build(:squatter, :first, email: "t"*242+"@occupybnb.com")
      expect(squatter).to_not be_valid
    end
    
    valid_email_address = %w(user@example.com USER@foo.COM A_US-ER@Foo.bar.org
                             first.last@foo.jp alice+bob@baz.cn user@an.example.com
                             12@example.com)
    valid_email_address.each do |email_address|
      it "must be a valid email address" do
	squatter = FactoryGirl.build(:squatter, :first, email: email_address)
	expect(squatter).to be_valid
      end
    end

    invalid_email_address = %w(user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com .@example.com
                               foo@bar..com)
    invalid_email_address.each do |email_address|
      it "must not be an invalid email address" do
	squatter = FactoryGirl.build(:squatter, :first, email: email_address)
	expect(squatter).to_not be_valid
      end
    end
  end

  describe "geocoding" do
    it "automatically geocodes the model on save" do
      squatter = FactoryGirl.create(:squatter, :second, location: "West Ham, London")
      expect(squatter.latitude).to eq(51.538265.to_d)
      expect(squatter.longitude).to eq(0.014525.to_d)
    end
  end
 
  describe "associations" do  
    it "may have an identity" do
      squatter = FactoryGirl.create(:squatter, :first)
      expect(squatter).to respond_to(:identities)
    end
    
    it "may have submitted abodes" do
      squatter = FactoryGirl.create(:squatter, :first)
      expect(squatter).to respond_to(:submitted_abodes)
    end
    
    it "may have received messages" do
      squatter = FactoryGirl.create(:squatter, :first)
      expect(squatter).to respond_to(:received_messages)
    end

    it "may have sent messages" do
      squatter = FactoryGirl.create(:squatter, :first)
      expect(squatter).to respond_to(:sent_messages)
    end

    it "may have abode reviews" do
      squatter = FactoryGirl.create(:squatter, :first)
      expect(squatter).to respond_to(:abode_reviews)
    end
  end
end
