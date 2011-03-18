class CashDetailsController < ApplicationController
  before_filter :authorize
  # GET /cash_details
  # GET /cash_details.xml
  def index
    @cash_details = CashDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cash_details }
    end
  end

  # GET /cash_details/1
  # GET /cash_details/1.xml
  def show
    @cash_detail = CashDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cash_detail }
    end
  end

  # GET /cash_details/new
  # GET /cash_details/new.xml
  def new
    @cash_detail = CashDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cash_detail }
    end
  end

  # GET /cash_details/1/edit
  def edit
    @cash_detail = CashDetail.find(params[:id])
  end

  # POST /cash_details
  # POST /cash_details.xml
  def create
    @cash_detail = CashDetail.new(params[:cash_detail])

    respond_to do |format|
      if @cash_detail.save
        flash[:notice] = 'CashDetail was successfully created.'
        format.html { redirect_to(@cash_detail) }
        format.xml  { render :xml => @cash_detail, :status => :created, :location => @cash_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cash_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cash_details/1
  # PUT /cash_details/1.xml
  def update
    @cash_detail = CashDetail.find(params[:id])

    respond_to do |format|
      if @cash_detail.update_attributes(params[:cash_detail])
        flash[:notice] = 'CashDetail was successfully updated.'
        format.html { redirect_to(@cash_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cash_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_details/1
  # DELETE /cash_details/1.xml
  def destroy
    @cash_detail = CashDetail.find(params[:id])
    @cash_detail.destroy

    respond_to do |format|
      format.html { redirect_to(cash_details_url) }
      format.xml  { head :ok }
    end
  end
end
