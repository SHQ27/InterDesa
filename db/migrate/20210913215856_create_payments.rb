class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.datetime :start, null: false
      t.datetime :due, null: false
      t.float :amount
      t.boolean :paid
      t.references :payment_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
