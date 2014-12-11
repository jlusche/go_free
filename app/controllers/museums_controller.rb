class MuseumsController < ApplicationController
  def index 
    @museums = Museum.all
    los_angeles_lat = 34.0630262
    los_angeles_long = -118.3576001
    radius = 64400
    query = 'usc'
    @museum = GooglePlacesQuery.new(query, los_angeles_lat, los_angeles_long, radius)
    @lacma = GooglePlacesQuery.new('LACMA', los_angeles_lat, los_angeles_long, radius)
    @latlong1 = Geocoder.coordinates(@museum.address)
    @latlong2 = Geocoder.coordinates(@lacma.address)
    @distance = Geocoder::Calculations.distance_between(@latlong1, @latlong2)
  #binding.pry
  end

  def show
  end

  def create
  end

  def new
  end
end
