require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:help)
    end
  end

  describe "GET #privacy" do
    it "returns http success" do
      get :privacy
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:privacy)
    end
  end

  describe "GET #tos" do
    it "returns http success" do
      get :tos
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:tos)
    end
  end

end
