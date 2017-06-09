require 'rails_helper'

feature 'abandon job' do
  scenario 'successfully' do
    responsible = create(:responsible)
    organization = create(:organization, responsible: responsible)
    job = create(:job, organization: organization)
    user = create(:user)
    create(:subscription, job: job, user: user)
    login_as user

    visit root_path
    click_on 'Subscriptions'
    click_on 'Abandon Job'

    expect(page).to have_content('Job abandoned')
  end
end
