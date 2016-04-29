class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # ##########################################################################################
  # Not Alllowing to display pages if the user is not authenticated for the entire application
  # ##########################################################################################
  before_action :authenticate_user!

  # ##########################################################################################
  # If you want to add an avatar to the User model, you need to sanitize regarding the strong params:
  # ##########################################################################################
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

end
