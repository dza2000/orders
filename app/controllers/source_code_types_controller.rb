class SourceCodeTypesController < ApplicationController
  before_filter :authorize
  # GET /source_code_types
  # GET /source_code_types.xml
  def index
    @source_code_types = SourceCodeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @source_code_types }
    end
  end

  # GET /source_code_types/1
  # GET /source_code_types/1.xml
  def show
    @source_code_type = SourceCodeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @source_code_type }
    end
  end

  # GET /source_code_types/new
  # GET /source_code_types/new.xml
  def new
    @source_code_type = SourceCodeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @source_code_type }
    end
  end

  # GET /source_code_types/1/edit
  def edit
    @source_code_type = SourceCodeType.find(params[:id])
  end

  # POST /source_code_types
  # POST /source_code_types.xml
  def create
    @source_code_type = SourceCodeType.new(params[:source_code_type])

    respond_to do |format|
      if @source_code_type.save
        flash[:notice] = 'SourceCodeType was successfully created.'
        format.html { redirect_to(@source_code_type) }
        format.xml  { render :xml => @source_code_type, :status => :created, :location => @source_code_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @source_code_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /source_code_types/1
  # PUT /source_code_types/1.xml
  def update
    @source_code_type = SourceCodeType.find(params[:id])

    respond_to do |format|
      if @source_code_type.update_attributes(params[:source_code_type])
        flash[:notice] = 'SourceCodeType was successfully updated.'
        format.html { redirect_to(@source_code_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @source_code_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /source_code_types/1
  # DELETE /source_code_types/1.xml
  def destroy
    @source_code_type = SourceCodeType.find(params[:id])
    @source_code_type.destroy

    respond_to do |format|
      format.html { redirect_to(source_code_types_url) }
      format.xml  { head :ok }
    end
  end
end
