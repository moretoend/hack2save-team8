require 'rails_helper'

feature "edit user profile" do

  given(:user) { create(:user) }
  background { login_as(user) }

  scenario "with all fields filled" do
    visit edit_user_registration_path
    fill_in "user[fullname]", with: "User 1"
    fill_in "user[document_number]", with: "123123123-12"
    choose("Female")
    click_button "Save Profile"
    user.reload
    expect(user.fullname).to eq "User 1"
    expect(user.document_number).to eq "123123123-12"
    expect(user.gender).to eq "female"
  end
end
