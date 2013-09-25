require 'spec_helper'

feature 'user can change roles', %q{
  As an admin
  I want to be able to change user's role
  So that I can assign other admins
  } do

  context "as an admin" do
    scenario "another user's role" do
      admin = FactoryGirl.create(:user, role: "admin")
      user = FactoryGirl.create(:user)

      sign_in_as(admin)
      visit user_path(user)
      click_link "Edit user"
      select("admin", :from => "user_role")
      click_button "Change role"

      expect(page).to have_content("User's role successfully changed")
    end
  end

  context "not as an admin" do
    scenario "must not be able to change other user's role" do
      malicious_user = FactoryGirl.create(:user, role: "employee")
      user = FactoryGirl.create(:user)

      sign_in_as(malicious_user)
      visit user_path(user)
      expect(page).to_not have_content("Edit user")
      visit edit_user_path(user)
      expect(page).to have_content("Access Denied")
    end
  end
end
