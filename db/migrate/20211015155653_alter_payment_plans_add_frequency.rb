class AlterPaymentPlansAddFrequency < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_plans, :frequency_id, :integer, :default => 0
  end
end
