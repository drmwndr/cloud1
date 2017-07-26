class ProductAlternative < ActiveRecord::Base
  belongs_to :master_product, class_name: 'Product'
  belongs_to :similar_product, class_name: 'Product'
  # attr_accessible :title, :body
  attr_accessible :master_product_id, :similar_product_id
end
