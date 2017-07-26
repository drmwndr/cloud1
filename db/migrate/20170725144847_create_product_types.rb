class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :description, null: false, limit: 45


      t.timestamps
    end
  end
end
