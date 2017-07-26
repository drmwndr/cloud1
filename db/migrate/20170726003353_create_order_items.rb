class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :line_item, null: false
      t.belongs_to :order, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :order_items, :line_item_id
    add_index :order_items, :order_id
  end
end
