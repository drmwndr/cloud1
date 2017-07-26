class OrderItem < ActiveRecord::Base
   belongs_to :line_item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}

  validate :line_item_present
  validate :order_presente

  attr_accessible :quantity, :order_id, :line_item_id

  private
  
  	def line_item_present
  		errors.add(:line_item, 'is not valid')  if line_item.nil?
  	end

  	def order_present
  		erros.add(:order, 'is not a valid order') if order.nil?
  	end
end
