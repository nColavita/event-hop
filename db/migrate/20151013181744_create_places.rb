class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      t.string :website
      t.string :description
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
