class AlterUnitsAddSquareMeters < ActiveRecord::Migration[6.1]
  def change
    add_column :units, :square_meters, :integer
  end
end
