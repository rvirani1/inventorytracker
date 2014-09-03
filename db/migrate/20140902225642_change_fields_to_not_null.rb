class ChangeFieldsToNotNull < ActiveRecord::Migration
  def change
    change_column :fields, :name, :string, :null => false
  end
end
