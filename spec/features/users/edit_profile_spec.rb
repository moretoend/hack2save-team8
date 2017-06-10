require 'rails_helper'

feature 'edit user profile' do

  given(:user) { create(:user) }
  background { login_as(user) }

  scenario 'with all fields filled' do
    visit edit_user_registration_path

    fill_in 'user[fullname]', with: 'User 1'
    fill_in 'user[document_number]', with: '123123123-12'
    choose('Female')
    fill_in 'user[address_attributes][country]', with: 'Brasil'
    fill_in 'user[address_attributes][state]', with: 'SP'
    fill_in 'user[address_attributes][city]', with: 'São Paulo'
    fill_in 'user[address_attributes][neighborhood]', with: 'Vila Prudente'
    fill_in 'user[address_attributes][street]', with: 'Rua XXX'
    fill_in 'user[address_attributes][number]', with: '100A'

    click_button 'Save Profile'

    user.reload

    expect(user.fullname).to eq 'User 1'
    expect(user.document_number).to eq '123123123-12'
    expect(user.gender).to eq 'female'
    expect(user.address.country).to eq 'Brasil'
    expect(user.address.state).to eq 'SP'
    expect(user.address.city).to eq 'São Paulo'
    expect(user.address.neighborhood).to eq 'Vila Prudente'
    expect(user.address.street).to eq 'Rua XXX'
    expect(user.address.number).to eq '100A'
  end
end
