class Coupon < ActiveRecord::Base
  validates :company_id, :presence => true
  validates :name, :presence => true
  
  belongs_to :company
  
  def expiration?
    puts start_date
    puts end_date
    if start_date == end_date
      false
    else
      true
    end
  end
end
