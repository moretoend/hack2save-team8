feature "list jobs" do
  given(:user) { create :user }
  background { sign_in user }

  given(:organization) { create :organization, responsible: user }
  given!(:jobs) { create_list :job, 5, organization: organization }

  scenario "all organization jobs must be shown" do
    visit organization_jobs_path(organization)
    expect_job_values(jobs)
  end
end


def expect_job_values(jobs)
  jobs.each do |job|
    [:title, :kind, :places, :description, :start_date, :end_date].each do |attrib|
      expect(page).to have_content job[attrib]
    end
  end
end
