require 'rails_helper'

describe SubscriptionsController, type: :controller do
  context 'GET #index' do
    it 'return all subscriptions from user' do
      user = create(:user)
      get :index
      expect(assigns(:user).name).to eq user.name
    end
    it 'render :index template' do

    end
  end
end
