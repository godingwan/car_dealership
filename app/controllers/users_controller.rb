class UsersController < ApplicationController
  authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: "User's role successfully changed."
    else
      redirect_to user_path(@user), alert: "Failed to change user's role."
    end
  end
end
