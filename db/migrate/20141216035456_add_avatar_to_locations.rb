class AddAvatarToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :avatar, :string
  end
end
