require 'rails_helper'
RSpec.describe AbodesController, type: :controller do
  let(:squatter) { FactoryGirl.create(:squatter, :first) }
  let(:abode) { FactoryGirl.create(:abode, :approved) }

  before :each do
    squatter.confirm
    sign_in squatter
  end

  describe "index" do
    it "should display the results" do 
      get :index
      expect(response).to render_template(:index)
    end
  end
  
  describe "new" do
    it "should display the new abode page" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "show" do
    it "should display the new abode page" do
      get :show, id: abode.id
      expect(response).to render_template(:show)
    end
  end
end
