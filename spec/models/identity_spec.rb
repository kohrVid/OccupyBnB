require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:squatter) { FactoryGirl.create(:squatter, :first) }
  it "should save with valid credentials" do
    identity = Identity.new(provider: Faker::Company.name, uid: Faker::Lorem.characters(16), squatter: squatter)
    expect(identity).to be_valid
  end
  
  it "should have a uid" do
    identity = Identity.new(provider: Faker::Company.name, squatter: squatter)
    expect(identity).to_not be_valid
  end
  
  it "should have a provider" do
    identity = Identity.new(uid: Faker::Lorem.characters(16), squatter: squatter)
    expect(identity).to_not be_valid
  end
end
