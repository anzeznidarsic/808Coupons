class CouponsController < ApplicationController
  http_basic_authenticate_with :name => '808', :password => 'coupons'
  
  before_filter :find_company
  
  layout 'admin'
  
  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.order('name ASC').where(:company_id => @company.id  )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @coupons }
    end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @coupon }
    end
  end

  # GET /coupons/new
  # GET /coupons/new.json
  def new
    @coupon = Coupon.new(:company_id => @company.id)
    @companies = Company.order('name ASC')
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find(params[:id])
    @companies = Company.order('name ASC')
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to :controller => 'coupons', :action => 'show', :id => @coupon.id, :company_id => @coupon.company_id, :notice => 'Coupon was successfully created.' }
        format.json { render :json => @coupon, :status => :created, :location => @coupon }
      else
        format.html { 
          @companies = Company.order('name ASC')
          render :action => "new"
        }
        format.json { render :json => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.json
   def update
    @coupon = Coupon.find(params[:id])
    
    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to @coupon, :company_id => @coupon.company_id, :notice => 'Coupon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to coupons_url, :company_id => @company.id }
      format.json { head :no_content }
    end
  end
  
  private
  def find_company
    if params[:company_id]
      @company = Company.find_by_id(params[:company_id])
    end
  end
end
