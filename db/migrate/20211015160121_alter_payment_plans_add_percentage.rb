class AlterPaymentPlansAddPercentage < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_plans, :percentage, :integer, :default => 0
  end
end
