class AddColumnsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :description, :text
    add_column :locations, :website, :string
    add_column :locations, :phone, :integer
    add_column :locations, :free_parking, :boolean
    add_column :locations, :parking_notes, :text
    add_column :locations, :tours, :text
    add_column :locations, :direction_notes, :text
    add_column :locations, :special_closure, :text
    add_column :locations, :event_notes, :text
  end
end
