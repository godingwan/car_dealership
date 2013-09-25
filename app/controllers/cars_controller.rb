class CarsController < ApplicationController
  def index
    @cars = current_user.cars
  end

  def new
    @car = current_user.cars.new
  end

  def create
    if current_user.role == "admin"
      @car = Car.new(params[:car])
    else
      @car = current_user.cars.new(params[:car])
    end

    if @car.save
      flash[:notice] = "Car added successfully."
      redirect_to user_cars_path(current_user)
    else
      flash[:alert] = "Failed to add car to inventory."
      render action: "new"
    end
  end
end
