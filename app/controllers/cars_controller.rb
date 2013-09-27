class CarsController < ApplicationController
  def index
    if params[:user_id]
      @cars = current_user.cars
    else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
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

  def edit
    @car = current_user.cars.find(params[:id])
  end

  def update
    @car = current_user.cars.find(params[:id])

    if @car.update_attributes(params[:car])
      redirect_to user_cars_path(current_user), notice: "Car's status successfully changed."
    else
      redirect_to user_cars_path(current_user), alert: "Failed to change car's status."
    end
  end
end
