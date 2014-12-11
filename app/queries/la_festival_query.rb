class LAFestivalsQuery
  def initialize
    festivals_la_city = HTTParty.get("https://data.lacity.org/api/views/acy8-72w9/rows.json?accessType=DOWNLOAD")

    @festivals = festivals_la_city.parsed_response

    @festival_names = @festivals["data"]
    
  end

end