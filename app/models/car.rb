class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :list_price, :make, :model, :year

  validates_presence_of :year, :make, :model, :user_id, :list_price
end
