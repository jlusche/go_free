class Event < ActiveRecord::Base
  belongs_to :location

scope :current, -> {where("start_time <= ? AND end_time > ?",DateTime.new(2014,12,18,17,0,0), DateTime.new(2014,12,18,17,0,0))}

#scope :current, -> {where("start_time <= ? AND end_time > ?",DateTime.now, DateTime.now)}

#scope :current, -> {where("start_time <= ? AND end_time > ?",DateTime.now, DateTime.now)}
  #Event.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)

  def over?
    Time.now.utc > end_time
  end
  
  def current?
    start_time <= DateTime.now.utc && end_time > DateTime.now.utc
  end
end

