class CreatePaymentPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_plans do |t|
      t.integer :number_of_payments, null: false
      t.references :unit, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.datetime :start, null: false
      t.datetime :end

      t.timestamps
    end
  end
end
