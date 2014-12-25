class AddColumnVenueToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :venue, :string
  end
end
