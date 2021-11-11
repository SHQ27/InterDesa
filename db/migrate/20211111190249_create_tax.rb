class CreateTax < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.references :price_list, null: false, foreign_key: true
      t.integer :name, null: false
      t.float :percentage_value_over_unit_price, null: false
      t.timestamps
    end
  end
end
