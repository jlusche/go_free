class FestivalsController < ApplicationController

  def index 
    festivals_la_city = HTTParty.get("https://data.lacity.org/api/views/acy8-72w9/rows.json?accessType=DOWNLOAD")

    @festivals = festivals_la_city.parsed_response

    @festival_names = @festivals["data"]




    events_la_city = HTTParty.get("https://data.lacity.org/resource/d3th-bqdk.json")

    @events = events_la_city.parsed_response

    @event_names = @festivals[""]


    
  end

  def show
  end

  def create
  end

  def new
  end

end
