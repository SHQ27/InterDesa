class AlterBuildingAddUnitStuff < ActiveRecord::Migration[6.1]
  def change
    add_column :buildings, :apartments, :integer
    add_column :buildings, :parkings, :integer
    add_column :buildings, :floors, :integer
    add_column :buildings, :apartments_per_floor, :integer
  end
end
