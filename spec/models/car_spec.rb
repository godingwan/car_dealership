require 'spec_helper'

describe Car do
  it 'must provide a year to be saved' do
    car = FactoryGirl.build(:car, year: nil)

    expect(car.save).to eq(false)
  end

  it 'must provide a make to be saved' do
    car = FactoryGirl.build(:car, make: nil)

    expect(car.save).to eq(false)
  end

  it 'must provide a model to be saved' do
    car = FactoryGirl.build(:car, model: nil)

    expect(car.save).to eq(false)
  end

  it 'must provide a user_id to be saved' do
    car = FactoryGirl.build(:car, user_id: nil)

    expect(car.save).to eq(false)
  end

  it 'must provide a list price to be saved' do
    car = FactoryGirl.build(:car, list_price: nil)

    expect(car.save).to eq(false)
  end
end
