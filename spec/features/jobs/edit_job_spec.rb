feature "edit a job" do
  given(:user) { create :user }
  background { sign_in user }

  given(:organization) { create(:organization, responsible: user) }
  given(:job) { create :job, organization: organization }

  context "with valid attributes" do
    scenario "must show a success message" do
      visit edit_organization_job_path(organization, job)
      expect_job_form_fields
      fill_in "job[title]", with: "New title"
      click_on "Update Job"
      expect(page).to have_content "Job was successfully updated"
    end
  end

  context "without valid attributes" do
    scenario "must show a error message" do
      visit edit_organization_job_path(organization, job)
      expect_job_form_fields
      fill_in "job[title]", with: nil
      click_on "Update Job"
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
