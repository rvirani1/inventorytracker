class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.integer :inventory_id
      t.integer :field_id
    end
  end
end
