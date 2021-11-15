class AlterFinancingsRemoveExtraColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :financings, :financing_percentage_value_over_unit_price
    remove_column :financings, :payment_percentage_value_over_financed_price
    remove_column :financings, :payment_frequency
  end
end
