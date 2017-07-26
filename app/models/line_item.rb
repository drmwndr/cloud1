class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :condition
  has_many :order_items

  default_scope { where('quantity > 0')}

  validates_associated :product, :condition
  validates :quantity, presence: true
  validates :stock_address, presence: true
  validates :product_id, presence: true
  validates :condition_id, presence: true

  attr_accessible :quantity, :batch_number, :exp_date, :remarks, :serial_number, 
  				  :stock_address, :product_id, :condition_id
end
