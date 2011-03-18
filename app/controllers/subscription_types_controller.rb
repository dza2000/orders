class SubscriptionTypesController < ApplicationController
  before_filter :authorize
  # GET /subscription_types
  # GET /subscription_types.xml
  def index
    @subscription_types = SubscriptionType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscription_types }
    end
  end

  # GET /subscription_types/1
  # GET /subscription_types/1.xml
  def show
    @subscription_type = SubscriptionType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription_type }
    end
  end

  # GET /subscription_types/new
  # GET /subscription_types/new.xml
  def new
    @subscription_type = SubscriptionType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription_type }
    end
  end

  # GET /subscription_types/1/edit
  def edit
    @subscription_type = SubscriptionType.find(params[:id])
  end

  # POST /subscription_types
  # POST /subscription_types.xml
  def create
    @subscription_type = SubscriptionType.new(params[:subscription_type])

    respond_to do |format|
      if @subscription_type.save
        flash[:notice] = 'SubscriptionType was successfully created.'
        format.html { redirect_to(@subscription_type) }
        format.xml  { render :xml => @subscription_type, :status => :created, :location => @subscription_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscription_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subscription_types/1
  # PUT /subscription_types/1.xml
  def update
    @subscription_type = SubscriptionType.find(params[:id])

    respond_to do |format|
      if @subscription_type.update_attributes(params[:subscription_type])
        flash[:notice] = 'SubscriptionType was successfully updated.'
        format.html { redirect_to(@subscription_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subscription_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_types/1
  # DELETE /subscription_types/1.xml
  def destroy
    @subscription_type = SubscriptionType.find(params[:id])
    @subscription_type.destroy

    respond_to do |format|
      format.html { redirect_to(subscription_types_url) }
      format.xml  { head :ok }
    end
  end
end
