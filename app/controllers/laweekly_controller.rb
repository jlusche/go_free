class LaweeklyController < ApplicationController

  def index 
    # laweekly_events = HTTParty.get("https://www.kimonolabs.com/api/63ipj8wo?apikey=#{ENV['KIMONO_KEY']}")
    # @laweekly = laweekly_events.parsed_response['results']['collection1']

    @laweekly = LaweeklyQuery.new.information

  end

  def show
  end

  def create
  end

  def new
  end

end