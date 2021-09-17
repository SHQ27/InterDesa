class AlterPaymentAddNotifiedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :due_notified_at, :datetime 
    add_column :payments, :upcoming_notified_at, :datetime 
  end
end
