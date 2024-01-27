class CreateHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
