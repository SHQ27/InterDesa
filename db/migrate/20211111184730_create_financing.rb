class CreateFinancing < ActiveRecord::Migration[6.1]
  def change
    create_table :financings do |t|
      t.references :price_list, null: false, foreign_key: true
      t.integer :payments, null: false
      t.float :financing_percentage_value_over_unit_price, null: false
      t.float :payment_percentage_value_over_financed_price, null: false
      t.integer :payment_frequency, null: false
      t.float :fee_percentage_value_over_financed_price, null: false
      t.timestamps
    end
  end
end
