class AlterPriceListRemoveAmounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :price_lists, :downpayment_amount
    remove_column :price_lists, :annual_payment_amount
  end
end
