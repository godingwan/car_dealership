require 'spec_helper'

describe Offer do
  it "must provide a user id to be saved" do
    offer = FactoryGirl.build(:offer, user_id: nil)

    expect(offer.save).to eq(false)
  end

  it "must provide a buyer id to be saved" do
    offer = FactoryGirl.build(:offer, buyer_id: nil)

    expect(offer.save).to eq(false)
  end

  it "must provide a car id to be saved" do
    offer = FactoryGirl.build(:offer, car_id: nil)

    expect(offer.save).to eq(false)
  end
end
