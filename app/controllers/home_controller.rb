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
    @companies.each { |c|
      c.distance = c.distance.to_d.round(2)
    }
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
  
  def error_location
  end
  
  # Search manually for location through text input
  def search_location
    @location = params[:location]
    s = Geocoder.search(@location)

    if (s[0])
      lat = s[0].latitude
      lon = s[0].longitude
    end
    
    if (lat && lon)
       redirect_to '/home/nearby?lat='+lat.to_s+'&lon='+lon.to_s
    end
  end
  
  private
  
  # Set layout (website can work as ajax or fullsite)
  def get_layout
    @layout = request.xhr? ? nil : 'front'
    @layout
  end

end