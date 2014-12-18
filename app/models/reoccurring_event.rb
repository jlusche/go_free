class ReoccurringEvent < ActiveRecord::Base
  belongs_to :location
  #attr_accessible :start_time, :end_time
end
