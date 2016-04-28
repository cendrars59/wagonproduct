class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # ##########################################################################################
  # Not Alllowing to display pages if the user is not authenticated for the entire application
  # ##########################################################################################
  before_action :authenticate_user!

end
