class HomeController < ApplicationController
  http_basic_authenticate_with :name => '808', :password => 'coupons'
  
  layout :get_layout
  
  def index
  end
  
  def nearby
    lat = params[:lat]
    lon = params[:lon]
    @companies = Company.near([lat, lon], 10)
  end
  
  def coupons
    company_id = params[:company_id]
    @coupons = Coupon.where(:company_id => company_id)
  end
  
  
  private
  
  def get_layout
    request.xhr? ? nil : 'front'
  end
end
