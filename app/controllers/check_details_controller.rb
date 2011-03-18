class CheckDetailsController < ApplicationController
  before_filter :authorize
  # GET /check_details
  # GET /check_details.xml
  def index
    @check_details = CheckDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @check_details }
    end
  end

  # GET /check_details/1
  # GET /check_details/1.xml
  def show
    @check_detail = CheckDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @check_detail }
    end
  end

  # GET /check_details/new
  # GET /check_details/new.xml
  def new
    @check_detail = CheckDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @check_detail }
    end
  end

  # GET /check_details/1/edit
  def edit
    @check_detail = CheckDetail.find(params[:id])
  end

  # POST /check_details
  # POST /check_details.xml
  def create
    @check_detail = CheckDetail.new(params[:check_detail])

    respond_to do |format|
      if @check_detail.save
        flash[:notice] = 'CheckDetail was successfully created.'
        format.html { redirect_to(@check_detail) }
        format.xml  { render :xml => @check_detail, :status => :created, :location => @check_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @check_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /check_details/1
  # PUT /check_details/1.xml
  def update
    @check_detail = CheckDetail.find(params[:id])

    respond_to do |format|
      if @check_detail.update_attributes(params[:check_detail])
        flash[:notice] = 'CheckDetail was successfully updated.'
        format.html { redirect_to(@check_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @check_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /check_details/1
  # DELETE /check_details/1.xml
  def destroy
    @check_detail = CheckDetail.find(params[:id])
    @check_detail.destroy

    respond_to do |format|
      format.html { redirect_to(check_details_url) }
      format.xml  { head :ok }
    end
  end
end
