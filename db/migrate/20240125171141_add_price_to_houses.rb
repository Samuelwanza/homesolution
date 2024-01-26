class AddPriceToHouses < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :price, :integer
  end
end
