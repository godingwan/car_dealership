class OffersController < ApplicationController
  def index
    @offers = Offer.where buyer_id: current_user
  end

  def new
    @offer = current_user.offers.new
    @buyer_collection = User.arrayify
    # TODO: Skinny controller, fat model
    @cars_owned_collection = []
    current_user.cars.each do |car|
      @cars_owned_collection << car.id
    end
  end

  def create
    @offer = current_user.offers.new(params[:offer])

    if @offer.save
      flash[:notice] = "Offer sent successfully."
      redirect_to user_cars_path(current_user)
    else
      flash[:alert] = "Failed to send offer."
      render action: "new"
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    @car = @offer.car
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(params[:offer])
      if params[:offer]["result"] == "1"
        @car = @offer.car
        @car.user_id = @offer.buyer_id
        @car.save
        redirect_to user_cars_path(current_user), notice: "Car's offer accepted."
      else
        redirect_to user_cars_path(current_user), notice: "Car's offer not accepted."
      end
    else
      redirect_to user_cars_path(current_user), alert: "Failed to change car's status."
    end
  end
end
