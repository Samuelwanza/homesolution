
class AddPaidToHouses < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :paid, :boolean, default: false
  end
end
