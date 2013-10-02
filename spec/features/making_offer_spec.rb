require 'spec_helper'

feature "selling a car" do
  let(:employee) { FactoryGirl.create(:user, role: "employee") }
  let(:customer) { FactoryGirl.create(:user) }
  let!(:sellable_car) { FactoryGirl.create(:car, user: employee) }
  scenario "employee creating an offer" do
    sign_in_as(employee)
    visit user_path(customer)
    click_link "Create offer"
    select(customer.email, :from => "offer_buyer_id")
    select(sellable_car.id, :from => "offer_car_id")
    click_button "Send offer"

    expect(page).to have_content("Offer sent successfully")
  end

  scenario "customer viewing the offer" do
    offer = FactoryGirl.create(:offer, user: employee, buyer_id: customer.id, car_id: sellable_car.id)

    sign_in_as(customer)
    visit offers_path
    click_link offer.car_id

    expect(page).to have_button("Update offer")
  end

  scenario "offer being accepted" do
    offer = FactoryGirl.create(:offer, user: employee, buyer_id: customer.id, car_id: sellable_car.id)

    sign_in_as(customer)
    visit edit_offer_path(offer)
    find(:css, '#offer_result').set(true)
    click_button "Update offer"

    expect(page).to have_content(sellable_car.model)
  end
end
