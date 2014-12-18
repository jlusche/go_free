class LocationsController < ApplicationController

  def index
   if params[:search].present?
      @locations = Location.near(params[:search], 50)
    else
      @locations = Location.near('Santa Monica, CA, US', 10)
    end

    events = []

    @locations.each do |location|
      events << location.events.current
    end

    @events = events.flatten.compact
  end

  
    #@user_location = Location.new(address:param[:search])


  def show
    @location = Location.find(params[:id])

    #@events = Event.find_by(:location_id)
  end

  def create
  end

  def new
    @user_location = Location.new
  end

end

