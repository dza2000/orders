class ShippingDetailsController < ApplicationController
  before_filter :authorize
  # GET /shipping_details
  # GET /shipping_details.xml
  def index
    @shipping_details = ShippingDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipping_details }
    end
  end

  # GET /shipping_details/1
  # GET /shipping_details/1.xml
  def show
    @shipping_detail = ShippingDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipping_detail }
    end
  end

  # GET /shipping_details/new
  # GET /shipping_details/new.xml
  def new
    @shipping_detail = ShippingDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipping_detail }
    end
  end

  # GET /shipping_details/1/edit
  def edit
    @shipping_detail = ShippingDetail.find(params[:id])
  end

  # POST /shipping_details
  # POST /shipping_details.xml
  def create
    @shipping_detail = ShippingDetail.new(params[:shipping_detail])

    respond_to do |format|
      if @shipping_detail.save
        flash[:notice] = 'ShippingDetail was successfully created.'
        format.html { redirect_to(@shipping_detail) }
        format.xml  { render :xml => @shipping_detail, :status => :created, :location => @shipping_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipping_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipping_details/1
  # PUT /shipping_details/1.xml
  def update
    @shipping_detail = ShippingDetail.find(params[:id])

    respond_to do |format|
      if @shipping_detail.update_attributes(params[:shipping_detail])
        flash[:notice] = 'ShippingDetail was successfully updated.'
        format.html { redirect_to(@shipping_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipping_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_details/1
  # DELETE /shipping_details/1.xml
  def destroy
    @shipping_detail = ShippingDetail.find(params[:id])
    @shipping_detail.destroy

    respond_to do |format|
      format.html { redirect_to(shipping_details_url) }
      format.xml  { head :ok }
    end
  end
end
