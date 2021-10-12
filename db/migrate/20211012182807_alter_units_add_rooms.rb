class AlterUnitsAddRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :units, :rooms, :integer
  end
end
