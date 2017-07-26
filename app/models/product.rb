class Product < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :product_uom

  has_many :alternatives, through: :product_alternatives, source: :master_product
  has_many :product_alternatives, foreign_key: 'similar_product_id'
  has_many :line_items

  
  accepts_nested_attributes_for :product_alternatives, :reject_if => proc { |attributes| attributes['master_product_id'].blank? }



  attr_accessible :description, :part_number, :sanitized_part_number, :product_type_id, :product_uom_id, 
  				  :product_alternatives_attributes

validates_associated :product_type, :product_uom

  validate :description, presence: true
  validate :sanitize_part_number, uniqueness: true, if: :part_number_present?

  before_validation :sanitize_part_number


def pn_with_description

self.part_number.nil? ? self.description : "(#{self.part_number}) #{self.description}"
end

  private

  def part_number_present?
  	!self.part_number.nil?
  end


  def sanitize_part_number
  	!self.part_number.nil? ? self.sanitized_part_number = self.part_number.gsub(/[^0-9a-z ]/i, '') : self.sanitized_part_number = nil
  end

end
