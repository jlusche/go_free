class LAFestivalsQuery
  def initialize
    festivals_la_city = HTTParty.get("https://data.lacity.org/api/views/acy8-72w9/rows.json?accessType=DOWNLOAD")

    @festivals = festivals_la_city.parsed_response

    la_libraries = HTTParty.get("https://data.lacity.org/resource/d3th-bqdk.json")
    
    @libraries = la_libraries.parsed_response   
  end

  def name 
    @festival_name = @festivals["data"]
    @library_event = @libraries["event_name"]
  end
end