class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :address
      t.string :phone
      t.string :document_number
      t.datetime :birth_date

      t.timestamps
    end
  end
end
