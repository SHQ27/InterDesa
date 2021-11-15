class AlterTaxesChangeNameType < ActiveRecord::Migration[6.1]
  def change
    remove_column :taxes, :name
    add_column :taxes, :name, :string
  end
end
