class SegmentDetailsController < ApplicationController
  before_filter :authorize
  # GET /segment_details
  # GET /segment_details.xml
  def index
    @segment_details = SegmentDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @segment_details }
    end
  end

  # GET /segment_details/1
  # GET /segment_details/1.xml
  def show
    @segment_detail = SegmentDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @segment_detail }
    end
  end

  # GET /segment_details/new
  # GET /segment_details/new.xml
  def new
    @segment_detail = SegmentDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @segment_detail }
    end
  end

  # GET /segment_details/1/edit
  def edit
    @segment_detail = SegmentDetail.find(params[:id])
  end

  # POST /segment_details
  # POST /segment_details.xml
  def create
    @segment_detail = SegmentDetail.new(params[:segment_detail])

    respond_to do |format|
      if @segment_detail.save
        flash[:notice] = 'SegmentDetail was successfully created.'
        format.html { redirect_to(@segment_detail) }
        format.xml  { render :xml => @segment_detail, :status => :created, :location => @segment_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @segment_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /segment_details/1
  # PUT /segment_details/1.xml
  def update
    @segment_detail = SegmentDetail.find(params[:id])

    respond_to do |format|
      if @segment_detail.update_attributes(params[:segment_detail])
        flash[:notice] = 'SegmentDetail was successfully updated.'
        format.html { redirect_to(@segment_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @segment_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /segment_details/1
  # DELETE /segment_details/1.xml
  def destroy
    @segment_detail = SegmentDetail.find(params[:id])
    @segment_detail.destroy

    respond_to do |format|
      format.html { redirect_to(segment_details_url) }
      format.xml  { head :ok }
    end
  end
end
