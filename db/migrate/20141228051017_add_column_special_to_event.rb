class AddColumnSpecialToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :special, :string
  end
end
