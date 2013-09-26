require 'spec_helper'

feature 'viewing sellable cars', %q{
  As a user
  I want to be able to see all cars
  So that I can shop around
  } do
  scenario "as a logged in user" do
    user = FactoryGirl.create(:user)
    car1 = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    car3 = FactoryGirl.create(:car, sellable: false)

    sign_in_as(user)
    visit cars_path

    expect(page).to have_content(car1.model)
    expect(page).to have_content(car1.make)
    expect(page).to have_content(car2.model)
    expect(page).to have_content(car1.make)
    expect(page).to_not have_content(car3.model)
    expect(page).to_not have_content(car3.make)
  end

  scenario "as a guest" do
    car1 = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    car3 = FactoryGirl.create(:car, sellable: false)

    visit cars_path

    expect(page).to have_content(car1.model)
    expect(page).to have_content(car1.make)
    expect(page).to have_content(car2.model)
    expect(page).to have_content(car1.make)
    expect(page).to_not have_content(car3.model)
    expect(page).to_not have_content(car3.make)
  end
end
