# Main frotnend controller driving all actions
# All actions are avaiable as fullpage and ajax partials

class HomeController < ApplicationController
  
#  http_basic_authenticate_with :name => 'aa', :password => 'bb'
  
  layout :get_layout
  
  # Index page
  def index
  end
  
  # List of companies nearby based on visitors location
  def nearby
    lat = params[:lat]
    lon = params[:lon]
    category_id = params[:category_id] || nil
    @companies = Company.near([lat, lon], 100).joins(:categories).uniq
    # filter categories
    if !(category_id.nil?) then
      @companies = @companies.where(['categories.id = ?', category_id])
    end
    categories = {}
    
    # format distance and extract categories
    @companies.each { |c|
      c.distance = c.distance.to_d.round(2)
      c.categories.each { |cat|
        if (categories[cat.id].nil?) then 
          categories[cat.id] = 1
        else
          categories[cat.id] += 1
        end
      }
    }
    
    # list existing categories with count of companies belonging to it
    @categories = Array.new
    Category.where({:active => true}).each do |cat|
      if !(categories[cat.id].nil?) then
        @categories << { :id => cat.id, :name => cat.name, :count => categories[cat.id]}
      end
    end
    
    # sort descending by number of hits in category
    @categories.sort_by! { |c| c[:count] }.reverse!
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