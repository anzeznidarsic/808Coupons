class HomeController < ApplicationController
  http_basic_authenticate_with :name => 'aa', :password => 'bb'
  
  layout :get_layout
  
  # Index page
  def index
  end
  
  # List of companies nearby based on visitors location
  def nearby
    lat = params[:lat]
    lon = params[:lon]
    @companies = Company.near([lat, lon], 10)
  end
  
  # List of coupons for one particular company
  def coupons
    company_id = params[:company_id]
    @coupons = Coupon.where(:company_id => company_id)
  end
  
  # View of one particular coupon with all information
  def coupon
    @coupon = Coupon.find(params[:id])
  end
  
  private
  
  # Set layour (website can work as ajax or fullsite)
  def get_layout
    request.xhr? ? nil : 'front'
  end

end