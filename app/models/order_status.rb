class OrderStatus < ActiveRecord::Base
	has_many :orders
  attr_accessible :description
end
