class LaweeklyQuery
  attr_accessor :laweekly

  def initialize
  
  end

  def information
    laweekly_events = HTTParty.get("https://www.kimonolabs.com/api/63ipj8wo?apikey=#{ENV['KIMONO_KEY']}")
    collection = laweekly_events.parsed_response['results']['collection'].each

   Event.create(
        location_id: location.id, 
        start_time: start_time, 
        end_time: end_time, 
        name: hash['event_name']
        )


  end

  def title
    information['Title']['text']
  end


  def venue
    @query['Location']['text']
  end

  def details
    @query['Details']
  end

  def info
    @query['Neighborhood']
  end

  def photo
    @query[]
  end

  def neighborhood
    @query[]
  end

  def tags
    @query[]
  end
end

