class ChangeInventoryNameToNotNull < ActiveRecord::Migration
  def change
    change_column :inventories, :name, :string, :null => false
  end
end
