class PagesController < ApplicationController

  # Alllowing to display pages even the user is not authenticated
  skip_before_action :authenticate_user!

  def home
    
  end


end
