class AddFullImgColumnToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :full_img, :string
  end
end
