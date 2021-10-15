class AlterPaymentPlansAddDownPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_plans, :down_payment, :float, :default => 0
  end
end
