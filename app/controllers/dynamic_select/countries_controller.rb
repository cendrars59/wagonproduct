module DynamicSelect
  class CountriesController < ApplicationController
    respond_to :json

    def index
      @countries = Country.where(:country_id => params[:country_id])
      respond_with(@countries)
    end
    
  end
end