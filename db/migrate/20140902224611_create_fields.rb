class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.boolean :user_values
      t.string :default_values
      t.string :structure

      t.timestamps
    end
  end
end
