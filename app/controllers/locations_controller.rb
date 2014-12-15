class LocationsController < ApplicationController

  def index
   if params[:search].present?
      @locations = Location.near(params[:search], 50)
    else
      @locations = Location.near('Santa Monica, CA, US', 10)
    end

    #@user_location = Location.new(address:param[:search])

  end

  def show
    @location = Location.find(params[:id])
  end

  def create
  end

  def new
    @user_location = Location.new
  end

end
