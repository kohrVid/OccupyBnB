require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "associations" do  
    it "may have approved abodes" do
      admin = FactoryGirl.create(:admin)
      expect(admin).to respond_to(:approved_abodes)
    end
  end
end
