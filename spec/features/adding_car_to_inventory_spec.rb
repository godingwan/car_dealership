require 'spec_helper'

feature 'user owns a car', %q{
  As a user
  I want to be able to add a car to my inventory
  So that I can sell it
  } do
  context 'as a sign in user' do
    before(:each) do
      user = FactoryGirl.create(:user)

      sign_in_as(user)
      click_link "Add Car"
      fill_in "Year", :with => "1990"
      fill_in "Make", :with => "Honda"
      fill_in "Model", :with => "Civic"
    end

    scenario 'I must be able to add a car' do
      fill_in "List price", :with => "19000"
      click_button "Add Car"

      expect(page).to have_content("Car added successfully.")
      expect(page).to have_content("Honda")
      expect(page).to have_content("Civic")
    end

    scenario 'I must provide all info for the car to be added' do
      click_button "Add Car"

      expect(page).to have_content("List pricecan't be blank")
    end
  end
end
