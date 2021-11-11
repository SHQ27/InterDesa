class CreatePriceList < ActiveRecord::Migration[6.1]
  def change
    create_table :price_lists do |t|
      t.references :building, null: false, foreign_key: true
      t.integer :unit_type_id, null: false
      t.integer :downpayment_amount, null: false
      t.float :downpayment_percentage_over_unit_price, null: false
      t.integer :annual_payment_amount, null: false
      t.float :annual_payment_percentage_over_unit_price, null: false
      t.timestamps
    end
  end
end
