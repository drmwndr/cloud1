class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :product, null: false
      t.belongs_to :condition, null: false
      t.integer :quantity, null: false
      t.date :exp_date
      t.string :serial_number, limit: 45
      t.string :batch_number, limit: 45
      t.string :stock_address, limit: 45, null: false
      t.text :remarks

      t.timestamps
    end
    add_index :line_items, :product_id
    add_index :line_items, :condition_id
  end
end
