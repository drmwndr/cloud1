class CreateProductUoms < ActiveRecord::Migration
  def change
    create_table :product_uoms do |t|
      t.string :description, null: false, limit: 45
      t.string :uom, null: false, limit: 6

      t.timestamps
    end
  end
end
