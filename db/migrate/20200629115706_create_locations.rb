class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.decimal :lat, precision: 18, scale: 16
      t.decimal :lng, precision: 18, scale: 16
      t.string :location_name

      t.timestamps
    end
    add_index :locations, [:lat, :lng]
  end
end
