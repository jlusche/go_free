class GooglePlacesQuery
  attr_accessor :museums
  
  def initialize(query, lat, long, radius)
    @query = query
    @lat = lat
    @long = long 
    @radius = radius
  end

  def place_id
    museums_google = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{@query}&location=#{@lat},#{@long}&radius=#{@radius}&key=#{ENV['GOOGLE_KEY']}")
    museums_google.parsed_response['results'][0]['place_id']
  end

  def museum_details
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['GOOGLE_KEY']}")
    response.parsed_response['result']
  end

  def name
    museum_details['name']
  end

  def address 
    museum_details['formatted_address']
  end

  def description
  end
end
