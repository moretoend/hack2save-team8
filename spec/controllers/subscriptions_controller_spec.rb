require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #accept" do
    it "returns http success" do
      get :accept
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #decline" do
    it "returns http success" do
      get :decline
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #remove" do
    it "returns http success" do
      get :remove
      expect(response).to have_http_status(:success)
    end
  end

end
