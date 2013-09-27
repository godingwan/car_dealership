class OffersController < ApplicationController
  def new
    @offer = current_user.offers.new
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
end
