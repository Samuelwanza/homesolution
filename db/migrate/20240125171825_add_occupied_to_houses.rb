class AddOccupiedToHouses < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :occupied, :boolean, default: false
  end
end
