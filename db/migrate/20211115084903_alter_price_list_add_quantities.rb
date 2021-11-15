class AlterPriceListAddQuantities < ActiveRecord::Migration[6.1]
  def change
    add_column :price_lists, :downpayment_quantity, :integer
    add_column :price_lists, :annual_payment_quantity, :integer
  end
end
