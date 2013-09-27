require 'spec_helper'

feature "making an offer for a car" do
  scenario "employee to customer" do
    employee = FactoryGirl.create(:user, role: "employee")
    customer = FactoryGirl.create(:user)
    sellable_car = FactoryGirl.create(:car, user: employee)

    sign_in_as(employee)
    visit user_path(customer)
    click_link "Create offer"
    fill_in "Buyer", :with => 1
    fill_in "Car", :with => 1
    click_button "Send offer"

    expect(page).to have_content("Offer sent successfully")
  end
end
