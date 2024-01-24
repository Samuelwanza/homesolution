class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :location_name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
