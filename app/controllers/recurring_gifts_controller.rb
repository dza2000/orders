class RecurringGiftsController < ApplicationController
  before_filter :authorize
  # GET /recurring_gifts
  # GET /recurring_gifts.xml
  def index
    @recurring_gifts = RecurringGift.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recurring_gifts }
    end
  end

  # GET /recurring_gifts/1
  # GET /recurring_gifts/1.xml
  def show
    @recurring_gift = RecurringGift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recurring_gift }
    end
  end

  # GET /recurring_gifts/new
  # GET /recurring_gifts/new.xml
  def new
    @recurring_gift = RecurringGift.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recurring_gift }
    end
  end

  # GET /recurring_gifts/1/edit
  def edit
    @recurring_gift = RecurringGift.find(params[:id])
  end

  # POST /recurring_gifts
  # POST /recurring_gifts.xml
  def create
    @recurring_gift = RecurringGift.new(params[:recurring_gift])

    respond_to do |format|
      if @recurring_gift.save
        flash[:notice] = 'RecurringGift was successfully created.'
        format.html { redirect_to(@recurring_gift) }
        format.xml  { render :xml => @recurring_gift, :status => :created, :location => @recurring_gift }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recurring_gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recurring_gifts/1
  # PUT /recurring_gifts/1.xml
  def update
    @recurring_gift = RecurringGift.find(params[:id])

    respond_to do |format|
      if @recurring_gift.update_attributes(params[:recurring_gift])
        flash[:notice] = 'RecurringGift was successfully updated.'
        format.html { redirect_to(@recurring_gift) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recurring_gift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_gifts/1
  # DELETE /recurring_gifts/1.xml
  def destroy
    @recurring_gift = RecurringGift.find(params[:id])
    @recurring_gift.destroy

    respond_to do |format|
      format.html { redirect_to(recurring_gifts_url) }
      format.xml  { head :ok }
    end
  end
end
