class LocationsController < ApplicationController

  def index
   if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end

    @user_location = Location.new(address:param[:search])
binding.pry
  end

  def show
  end

  def create
  end

  def new
    @user_location = Location.new
  end

end
