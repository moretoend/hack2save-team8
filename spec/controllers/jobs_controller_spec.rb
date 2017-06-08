describe JobsController, type: :controller do

  let(:organization) { create(:organization) }
  let(:user) { create(:user) }

  before { sign_in user }

  context "GET #index" do
    let!(:jobs) { create_list(:job, 5, organization: organization) }

    it "return all @jobs" do
      get :index, params: { organization_id: organization.id }
      expect(assigns(:jobs)).to eq jobs
    end

    it "render :index templates" do
      get :index, params: { organization_id: organization.id }
      expect(response).to render_template :index
    end
  end


  context "GET #new" do
    it "assigns a new @job" do
      get :new, params: { organization_id: organization.id }
      expect(assigns(:job)).to be_a_new(Job)
    end

    it "render :new template" do
      get :new, params: { organization_id: organization.id }
      expect(response).to render_template :new
    end
  end


  context "POST #create" do
    context "with valid params" do
      let(:job) { attributes_for(:job, organization: organization) }

      it "creates a new job" do
        expect {
          post :create, params: { organization_id: organization.id, job: job }
        }.to change(Job, :count).by 1
      end

      it "redirect_to show view" do
        post :create, params: { organization_id: organization.id, job: job }
        expect(response).to redirect_to organization_job_path(organization, organization.jobs.last)
      end
    end

    context "with invalid params" do
      let(:job) { build(:job, title: nil) }

      it "doesn't create a new job" do
        expect {
          post :create, params: { organization_id: organization.id, job: job }
        }.to_not change(Job, :count)
      end

      it "re-render :new template" do
        post :create, params: { organization_id: organization.id, job: job }
        expect(response).to render_template :new
      end
    end
  end


  context "GET #show" do
    let!(:job) { create(:job, organization: organization) }

    it "assigns a @job" do
      get :show, params: { organization_id: organization.id, id: job.id }
      expect(assigns(:job)).to eq job
    end

    it "render :show template" do
      get :show, params: { organization_id: organization.id, id: job.id }
      expect(response).to render_template :show
    end
  end


  context "GET #edit" do
    let(:job) { create(:job, organization: organization) }

    it "assigns a @job" do
      get :edit, params: { organization_id: organization.id, id: job.id }
      expect(assigns(:job)).to eq job
    end

    it "render :edit template" do
      get :edit, params: { organization_id: organization.id, id: job.id }
      expect(response).to render_template :edit
    end
  end


  context "PATCH #update" do
    let(:job) { create(:job, organization: organization) }

    context "with valid params" do
      it "updates job" do
        patch :update, params: { organization_id: organization.id, id: job.id, job: attributes_for(:job) }
        job.reload
        expect(assigns(:job)).to eq job
      end

      it "redirect_to :show view" do
        patch :update, params: { organization_id: organization.id, id: job.id, job: attributes_for(:job) }
        job.reload
        expect(response).to redirect_to organization_job_path(organization, job)
      end
    end

    context "with invalid params" do
      it "doesn't create a new job" do
        patch :update, params: { organization_id: organization.id, id: job.id, job: attributes_for(:job, title: nil) }
        expect(assigns(:job)).to eq job
      end

      it "re-render :edit template" do
        patch :update, params: { organization_id: organization.id, id: job.id, job: attributes_for(:job, title: nil) }
        expect(response).to render_template :edit
      end
    end
  end


  context "DELETE #destroy" do
    let!(:job) { create(:job, organization: organization) }

    it "destroys an element" do
      expect{
        delete :destroy, params: { organization_id: organization.id, id: job.id }
      }.to change(Job,:count).by(-1)
    end

    it "redirect_to :index page" do
      delete :destroy, params: { organization_id: organization.id, id: job.id }
      expect(response).to redirect_to organization_jobs_path(organization)
    end
  end
end
