feature "search jobs" do
  given(:user) { create(:user) }
  background { sign_in user }

  given!(:jobs) { create_list(:job, 5) }
  given!(:filtered_jobs) { create_list(:job, 5, title: "Search") }

  context "with empty search field" do
    scenario "must return all jobs without filter" do
      visit root_path
      expect(page).to have_selector "form#search_jobs div input[name='search[text]']"
      find("button#send_search").click
      expect_jobs_loaded(jobs + filtered_jobs)
    end
  end

  context "with search text" do
    scenario "must return filtered jobs" do
      visit root_path
      expect(page).to have_selector "form#search_jobs div input[name='search[text]']"
      fill_in "search[text]", with: "Search"
      find("button#send_search").click
      expect(page).to have_content filtered_jobs.first.title, count: 5
      expect(page).to_not have_content jobs.first.title
    end
  end
end


def expect_jobs_loaded(jobs)
  jobs.each do |job|
    [:title, :kind, :description, :start_date, :end_date].each do |attrib|
      expect(page).to have_content job[attrib]
    end

    expect(page).to have_content "#{job[:places]} places"
  end
end
