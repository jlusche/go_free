class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.string :city
      t.string :neighborhood
      t.text :tours
      t.text :description
      t.integer :parking
      t.text :parking_notes
      t.text :direction_notes

      t.timestamps null: false
    end
  end
end
