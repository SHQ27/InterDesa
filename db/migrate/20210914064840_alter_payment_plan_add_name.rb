class AlterPaymentPlanAddName < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_plans, :name, :string 
  end
end
