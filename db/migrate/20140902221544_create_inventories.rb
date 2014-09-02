class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name

      t.timestamps
    end
    add_index :inventories, :name
  end
end
