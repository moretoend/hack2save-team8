require 'rails_helper'

feature 'User apply to a job' do
  scenario 'successfully' do
    responsible = create(:responsible)
    organization = create(:organization, responsible: responsible)
    job = create(:job, organization: organization)
    user = create(:user)
    subscription = build(:subscription)
    login_as user

    visit new_user_subscription_path(job_id: job.id)

    fill_in 'Cover Letter', with: subscription.notes 
    click_on 'Confirm Application'

    expect(page).to have_content 'Job applied!'
  end
end
