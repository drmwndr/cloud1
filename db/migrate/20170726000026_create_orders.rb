class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :order_status

      t.timestamps
    end
    add_index :orders, :order_status_id
  end
end
