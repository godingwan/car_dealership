require 'spec_helper'

feature "changing a car's sell status" do
  scenario "as the owner of a car" do
    user = FactoryGirl.create(:user)
    car = FactoryGirl.create(:car, user: user)

    sign_in_as(user)
    visit user_cars_path(user)
    click_link car.model
    click_link "Change car status"
    find(:css, '#car_sellable').set(false)
    click_button "Save"

    expect(page).to have_content("Car's status successfully changed.")
  end

  scenario "is not possible if not the owner" do
    malicious_user = FactoryGirl.create(:user)
    car = FactoryGirl.create(:car)

    sign_in_as(malicious_user)
    visit car_path(car)

    expect(page).to_not have_content("Change car status")
  end
end
