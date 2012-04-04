class Company < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :zip, :presence => true
  
  geocoded_by :full_address
  after_validation :geocode
  
  has_many :coupons, :dependent => :destroy
  
  def full_address
    [address, city, zip, state].compact.join(', ')
  end
end
