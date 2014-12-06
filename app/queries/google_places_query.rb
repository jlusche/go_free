class GooglePlacesQuery
  def initialize(query)
    @query = query
    @response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=LACMA&key=AIzaSyBqlEkJ2w42BkX683FlPxwt4k4gylbO8dw")
  end

  def placeid
  
  end
end
