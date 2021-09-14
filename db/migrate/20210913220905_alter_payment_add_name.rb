class AlterPaymentAddName < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :name, :string  
  end
end
