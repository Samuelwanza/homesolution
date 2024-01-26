class RemoveOwnerIdFromHouses < ActiveRecord::Migration[7.1]
  def change
    remove_column :houses, :owner_id, :bigint
  end
end
