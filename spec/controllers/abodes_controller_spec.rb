require 'rails_helper'
RSpec.describe AbodesController, type: :controller do
  let(:squatter) { FactoryGirl.create(:squatter, :first) }
  describe "Index" do
    before :each do
      squatter.confirm
      sign_in squatter
    end

    it "should display the results" do 
      get :index
      expect(response).to render_template(:index)
    end
  end
end
