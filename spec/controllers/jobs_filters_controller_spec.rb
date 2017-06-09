describe JobsFiltersController, type: :controller do

  let(:user) { create(:user) }

  before { sign_in user }


  context "GET #index" do
    let(:user_organization) { create(:organization, responsible: user) }
    let(:no_user_organization) { create(:organization) }

    let!(:user_organization_jobs) { create_list(:job, 5, organization: user_organization) }
    let!(:no_user_organization_jobs) { create_list(:job, 5, organization: no_user_organization) }

    context "without :search text" do
      it "returns all @jobs out of his organization" do
        get :index
        expect(assigns(:jobs)).to match_array no_user_organization_jobs
      end

      it "must not return @jobs of his organization" do
        get :index
        expect(assigns(:jobs)).to_not match_array(user_organization_jobs)
      end
    end

    context "with :search text" do
      let!(:no_user_organization_search_jobs) { create_list(:job, 5, title: "Search", organization: no_user_organization) }
      let!(:user_organization_search_jobs) { create_list(:job, 5, title: "Search", organization: user_organization) }

      it "returns all @jobs out of his organization that following search text" do
        get :index, params: { search: { text: "Search" } }
        expect(assigns(:jobs)).to eq no_user_organization_search_jobs
      end

      it "must not returns @jobs of his organization that following search text" do
        get :index, params: { search: { text: "Search" } }
        expect(assigns(:jobs)).to_not match_array(user_organization_search_jobs)
      end

      it "must not returns @jobs that doesn't follow search text" do
        get :index, params: { search: { text: "Search" } }
        expect(assigns(:jobs)).to_not include(user_organization_jobs + no_user_organization_jobs)
      end
    end
  end
end
