class Condition < ActiveRecord::Base
  has_many :line_items
  attr_accessible :description
  
  validates :description, presence: true
end
