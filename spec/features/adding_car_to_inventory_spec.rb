require 'spec_helper'

feature 'user owns a car', %q{
  As a user
  I want to be able to add a car to my inventory
  So that I can list it for sell
  } do
  context 'as a customer' do
    before(:each) do
      user = FactoryGirl.create(:user)

      sign_in_as(user)
      click_link "Add Car"
      select("1990", :from => "car_year")
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

  context 'as an employee' do
    scenario 'I must be able to add a car' do
      user = FactoryGirl.create(:user, role: "employee")

      sign_in_as(user)
      click_link "Add Car"
      select("1990", :from => "car_year")
      fill_in "Make", :with => "Honda"
      fill_in "Model", :with => "Civic"
      fill_in "List price", :with => "19000"
      click_button "Add Car"

      expect(page).to have_content("Car added successfully.")
      expect(page).to have_content("Honda")
      expect(page).to have_content("Civic")
    end
  end

  context 'as an admin' do
    before(:each) do
      admin = FactoryGirl.create(:user, role: "admin")

      sign_in_as(admin)
      click_link "Add Car"
      select("1990", :from => "car_year")
      fill_in "Make", :with => "Honda"
      fill_in "Model", :with => "Civic"
      fill_in "List price", :with => "19000"
    end

    scenario 'I must be able to add a car' do
      click_button "Add Car"

      expect(page).to have_content("Car added successfully.")
      expect(page).to have_content("Honda")
      expect(page).to have_content("Civic")
    end

    scenario "I must be able to add a car to a employee
      or customer's inventory" do
      customer = FactoryGirl.create(:user, role: "customer")

      fill_in "User", :with => customer.id
      click_button "Add Car"

      expect(page).to have_content("Car added successfully.")
      expect(page).to_not have_content("Honda")
      expect(page).to_not have_content("Civic")
    end
  end
end
