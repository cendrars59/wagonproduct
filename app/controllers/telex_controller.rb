class TelexController < ApplicationController

  def index
    @telexes= Telex.all
  end

  def show
    @telex = Telex.find(params[:id])
  end


end
