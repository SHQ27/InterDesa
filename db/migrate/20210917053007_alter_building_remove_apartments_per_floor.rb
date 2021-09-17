class AlterBuildingRemoveApartmentsPerFloor < ActiveRecord::Migration[6.1]
  def change
    remove_column :buildings, :apartments_per_floor
  end
end
