class CreateFieldvalues < ActiveRecord::Migration
  def change
    create_table :fieldvalues do |t|
      t.integer :inventory_id
      t.integer :field_id
      t.string :value

      t.timestamps
    end
  end
end
