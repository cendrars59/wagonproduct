class TelexController < ApplicationController

  def index
    @telexes= Telex.all
  end

  def show
    @telex = Telex.find(params[:id])
  end

  def new
    @telex = Telex.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end



end
