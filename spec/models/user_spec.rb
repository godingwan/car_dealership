require 'spec_helper'

describe User do
  it "must put all user email into an array" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    expect(User.arrayify).to eql([user1.email, user2.email])
  end
end
