class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.integer :type_id, null: false
      t.float :price, default: 0
      t.text :details
      t.references :building, null: false, foreign_key: true
      t.timestamps
    end
  end
end
