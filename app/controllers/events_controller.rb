class EventsController < ApplicationController
  def index
    #@events = Event.current(Time.now)
    schedule = IceCube::Schedule.new(now = Time.now) do |s|
      s.add_recurrence_rule(IceCube::Rule.daily.count(3))
      s.add_exception_time(now + 1.day)
    end
  end

  def show
    @event = Event.find(params[:id])
  end


end