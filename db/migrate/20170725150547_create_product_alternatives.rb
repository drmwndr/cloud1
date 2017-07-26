class CreateProductAlternatives < ActiveRecord::Migration
  def change
    create_table :product_alternatives do |t|
      t.belongs_to :master_product, null: false
      t.belongs_to :similar_product, null: false

      t.timestamps
    end
    add_index :product_alternatives, :master_product_id
    add_index :product_alternatives, :similar_product_id
  end
end
