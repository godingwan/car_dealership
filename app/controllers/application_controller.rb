class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    user_cars_path(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access Denied"
    redirect_to root_url
  end
end
