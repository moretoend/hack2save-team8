require 'rails_helper'

feature 'User accept user application' do
  scenario 'successfully' do
    pending
n   responsible = create(:responsible)
    organization = create(:organization, responsible: responsible)
    job = create(:job, organization: organization)
    user = create(:user)
    subscription = create(:subscription, user: user, job: job)
    login_as responsible

    visit job_subscriptions_path job
    click_on 'Accept Volunteer'

    expect(page).to have_content 'Volunteer Hired'
  end
end
