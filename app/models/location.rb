class Location < ActiveRecord::Base
  has_many :events #, -> { where "confirmed = 1" }
  has_many :reoccuring_events
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  mount_uploader :avatar, AvatarUploader
end
