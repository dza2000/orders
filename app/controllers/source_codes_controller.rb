class SourceCodesController < ApplicationController
  before_filter :authorize
  # GET /source_codes
  # GET /source_codes.xml
  def index
    @source_codes = SourceCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @source_codes }
    end
  end

  # GET /source_codes/1
  # GET /source_codes/1.xml
  def show
    @source_code = SourceCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @source_code }
    end
  end

  # GET /source_codes/new
  # GET /source_codes/new.xml
  def new
    @source_code = SourceCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @source_code }
    end
  end

  # GET /source_codes/1/edit
  def edit
    @source_code = SourceCode.find(params[:id])
  end

  # POST /source_codes
  # POST /source_codes.xml
  def create
    @source_code = SourceCode.new(params[:source_code])

    respond_to do |format|
      if @source_code.save
        flash[:notice] = 'SourceCode was successfully created.'
        format.html { redirect_to(@source_code) }
        format.xml  { render :xml => @source_code, :status => :created, :location => @source_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @source_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /source_codes/1
  # PUT /source_codes/1.xml
  def update
    @source_code = SourceCode.find(params[:id])

    respond_to do |format|
      if @source_code.update_attributes(params[:source_code])
        flash[:notice] = 'SourceCode was successfully updated.'
        format.html { redirect_to(@source_code) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @source_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /source_codes/1
  # DELETE /source_codes/1.xml
  def destroy
    @source_code = SourceCode.find(params[:id])
    @source_code.destroy

    respond_to do |format|
      format.html { redirect_to(source_codes_url) }
      format.xml  { head :ok }
    end
  end
end
