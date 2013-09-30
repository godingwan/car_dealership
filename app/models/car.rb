class Car < ActiveRecord::Base
  belongs_to :user
  attr_accessible :list_price, :make, :model, :year, :user_id, :sellable, :image
  # TODO: find a more secure way to change ownership of a car
  mount_uploader :image, ImageUploader

  validates_presence_of :year, :make, :model, :user_id, :list_price
  has_one :offer
end
