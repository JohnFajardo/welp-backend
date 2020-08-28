class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :location_id
      t.text :body

      t.timestamps
    end
  end
end
