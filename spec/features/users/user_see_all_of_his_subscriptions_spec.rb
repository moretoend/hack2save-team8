require 'rails_helper'

feature 'user sees all subscriptions from a job' do
  scenario 'successfully' do
    responsible = create(:responsible)
    organization = create(:organization, responsible: responsible)
    job = create(:job, organization: organization)
    user = create(:user)
    create(:subscription, user: user, job: job)
    login_as user

    visit root_path
    click_on 'Subscriptions'

    within('.box-body') do
      expect(page).to have_selector('tbody', count: user.subscriptions.count)
    end
  end
end
