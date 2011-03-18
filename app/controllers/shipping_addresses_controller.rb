class ShippingAddressesController < ApplicationController
  before_filter :authorize
  # GET /shipping_addresses
  # GET /shipping_addresses.xml
  def index
    @shipping_addresses = ShippingAddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipping_addresses }
    end
  end

  # GET /shipping_addresses/1
  # GET /shipping_addresses/1.xml
  def show
    @shipping_address = ShippingAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipping_address }
    end
  end

  # GET /shipping_addresses/new
  # GET /shipping_addresses/new.xml
  def new
    @shipping_address = ShippingAddress.new(:contact_id => params[:contact_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipping_address }
    end
  end

  # GET /shipping_addresses/1/edit
  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  # POST /shipping_addresses
  # POST /shipping_addresses.xml
  def create
    @shipping_address = ShippingAddress.new(params[:shipping_address])

    respond_to do |format|
      if @shipping_address.save
        flash[:notice] = 'ShippingAddress was successfully created.'
        format.html { redirect_to(@shipping_address) }
        format.xml  { render :xml => @shipping_address, :status => :created, :location => @shipping_address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipping_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipping_addresses/1
  # PUT /shipping_addresses/1.xml
  def update
    @shipping_address = ShippingAddress.find(params[:id])

    respond_to do |format|
      if @shipping_address.update_attributes(params[:shipping_address])
        flash[:notice] = 'ShippingAddress was successfully updated.'
        format.html { redirect_to(@shipping_address) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipping_address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_addresses/1
  # DELETE /shipping_addresses/1.xml
  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy

    respond_to do |format|
      format.html { redirect_to(shipping_addresses_url) }
      format.xml  { head :ok }
    end
  end
end
