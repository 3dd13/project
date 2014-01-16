class AddNewColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :subscription, :boolean
  end
end
