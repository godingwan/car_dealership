class CarsController < ApplicationController
  def index
    @cars = current_user.cars
  end

  def new
    @user = current_user
    @car = current_user.cars.new
  end

  def create
    @car = current_user.cars.new(params[:car])

    if @car.save
      flash[:notice] = "Car added successfully."
      redirect_to user_cars_path(current_user)
    else
      flash[:alert] = "Failed to add car to inventory."
      render action: "new"
    end
  end
end
