require 'rails_helper'

describe User::SubscriptionsController, type: :controller do
  let(:responsible) { create(:responsible) }
  let(:organization) { create(:organization, responsible: responsible) }
  let(:job) { create(:job, organization: organization) }
  let(:user) { create(:user) }
  before { sign_in user }

  context 'GET #index' do
    let!(:subscription) { create(:subscription, job_id: job.id, user_id: user.id) }
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @subscription' do
      get :index
      expect(assigns(:subscriptions)).to eq [subscription]
    end
  end

  context 'GET #new' do
    it 'render the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns a new @subscriptions' do
      get :new, params: { job_id: job.id }
      expect(assigns(:subscription)).to be_a_new(Subscription)
    end
  end

  context 'POST #create' do
    context "with valid params" do
      let(:subscription) { attributes_for(:subscription, job: job, user: user) }

      it 'creates a new subscriptions' do
        expect {
          post :create, params: { subscription: subscription, job_id: job.id }
        }.to change(Subscription, :count).by 1
      end

      it 'redirect_to root' do
        post :create, params: { subscription: subscription, job_id: job.id }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid params' do
      let(:subscription) { build(:subscription, job: job) }
      it 'doesnt create a new subscription' do
        expect {
          post :create, params: { subscription: subscription }
        }.to_not change(Subscription, :count)
      end

      it 're-render :new template' do
          post :create, params: { subscription: subscription }
          expect(response).to render_template :new
      end
    end
  end
end
