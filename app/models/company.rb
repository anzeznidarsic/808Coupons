class Company < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true
  
  has_many :coupons, :dependent => :destroy
end
