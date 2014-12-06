require 'httparty'
require 'dotenv'


class MuseumsController < ApplicationController
  def index 
    @museums = Museum.all
    @response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=LACMA&key=AIzaSyBqlEkJ2w42BkX683FlPxwt4k4gylbO8dw")
  end

  def show
  end

  def create
  end

  def new
  end
end
