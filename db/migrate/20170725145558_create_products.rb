class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :product_type, null: false
      t.belongs_to :product_uom, null: false, default: 1
      t.string :part_number, limit: 45
      t.string :sanitized_part_number, limit: 45
      t.string :description, null: false, limit: 45

      t.timestamps
    end
    add_index :products, :product_type_id
    add_index :products, :product_uom_id
  end
end
