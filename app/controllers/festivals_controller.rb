class FestivalsController < ApplicationController

  def index 
    la_festivals = HTTParty.get("https://data.lacity.org/api/views/acy8-72w9/rows.json?accessType=DOWNLOAD")

    @festivals = la_festivals.parsed_response

    la_libraries = HTTParty.get("https://data.lacity.org/resource/d3th-bqdk.json")

    @libraries = la_libraries.parsed_response
  end

  def show
  end

  def create
  end

  def new
  end

end


