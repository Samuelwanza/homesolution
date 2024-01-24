class AddForeignKeyTohouse < ActiveRecord::Migration[7.1]
  def change
    add_reference :houses, :owner, foreign_key: { to_table: :users }, null: false
    add_reference :houses, :tenant, foreign_key: { to_table: :users }, null: true 
  end
end
