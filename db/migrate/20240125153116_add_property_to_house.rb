class AddPropertyToHouse < ActiveRecord::Migration[7.1]
  def change
    add_reference :houses, :property
  end
end
