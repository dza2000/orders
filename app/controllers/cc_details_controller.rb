class CcDetailsController < ApplicationController
  before_filter :authorize
  # GET /cc_details
  # GET /cc_details.xml
  def index
    @cc_details = CcDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cc_details }
    end
  end

  # GET /cc_details/1
  # GET /cc_details/1.xml
  def show
    @cc_detail = CcDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cc_detail }
    end
  end

  # GET /cc_details/new
  # GET /cc_details/new.xml
  def new
    @cc_detail = CcDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cc_detail }
    end
  end

  # GET /cc_details/1/edit
  def edit
    @cc_detail = CcDetail.find(params[:id])
  end

  # POST /cc_details
  # POST /cc_details.xml
  def create
    @cc_detail = CcDetail.new(params[:cc_detail])

    respond_to do |format|
      if @cc_detail.save
        flash[:notice] = 'CcDetail was successfully created.'
        format.html { redirect_to(@cc_detail) }
        format.xml  { render :xml => @cc_detail, :status => :created, :location => @cc_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cc_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cc_details/1
  # PUT /cc_details/1.xml
  def update
    @cc_detail = CcDetail.find(params[:id])

    respond_to do |format|
      if @cc_detail.update_attributes(params[:cc_detail])
        flash[:notice] = 'CcDetail was successfully updated.'
        format.html { redirect_to(@cc_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cc_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cc_details/1
  # DELETE /cc_details/1.xml
  def destroy
    @cc_detail = CcDetail.find(params[:id])
    @cc_detail.destroy

    respond_to do |format|
      format.html { redirect_to(cc_details_url) }
      format.xml  { head :ok }
    end
  end
end
