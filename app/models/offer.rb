class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :car
  attr_accessible :buyer_id, :car_id, :result

  validates_presence_of :buyer_id, :user_id, :car_id
end
