class Coupon < ActiveRecord::Base
  validates :company_id, :presence => true
  validates :name, :presence => true
  
  belongs_to :company
end
