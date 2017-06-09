feature "create a new job" do
  given(:user) { create :user }
  background { sign_in user }

  context "with valid attributes" do

    given(:organization) { create(:organization, responsible: user) }
    given(:job) { attributes_for :job, organization: organization }

    scenario "must show a success message" do
      visit new_organization_job_path(organization)
      expect_job_form_fields
      fill_job_fields(job)
      click_on "Create Job"
      expect(page).to have_content "Job was successfully created"
    end
  end

  context "without valid attributes" do
    given(:organization) { create(:organization, responsible: user) }
    given(:job) { attributes_for :job, organization: organization, title: nil }

    scenario "must show a error message" do
      visit new_organization_job_path(organization)
      expect_job_form_fields
      fill_job_fields(job)
      click_on "Create Job"
      expect(page).to have_content "can't be blank"
    end
  end
end


def expect_job_form_fields
  expect(page).to have_content "Title"
  expect(page).to have_content "Kind"
  expect(page).to have_content "Places"
  expect(page).to have_content "Description"
  expect(page).to have_content "Start date"
  expect(page).to have_content "End date"
end


def fill_job_fields(job)
  fill_in "job[title]", with: job[:title]
  fill_in "job[kind]", with: job[:kind]
  fill_in "job[places]", with: job[:places]
  fill_in "job[description]", with: job[:description]
  fill_in "job[start_date]", with: job[:start_date]
  fill_in "job[end_date]", with: job[:end_date]
end
