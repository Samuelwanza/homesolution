class AddForeignKeyToRequest < ActiveRecord::Migration[7.1]
  def change
    add_reference :requests, :owner, foreign_key: { to_table: :users }
    add_reference :requests, :tenant, foreign_key: { to_table: :users }
  end
end
