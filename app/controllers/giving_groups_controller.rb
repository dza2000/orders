class GivingGroupsController < ApplicationController
  before_filter :authorize
  # GET /giving_groups
  # GET /giving_groups.xml
  def index
    @giving_groups = GivingGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @giving_groups }
    end
  end

  # GET /giving_groups/1
  # GET /giving_groups/1.xml
  def show
    @giving_group = GivingGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @giving_group }
    end
  end

  # GET /giving_groups/new
  # GET /giving_groups/new.xml
  def new
    @giving_group = GivingGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @giving_group }
    end
  end

  # GET /giving_groups/1/edit
  def edit
    @giving_group = GivingGroup.find(params[:id])
  end

  # POST /giving_groups
  # POST /giving_groups.xml
  def create
    @giving_group = GivingGroup.new(params[:giving_group])

    respond_to do |format|
      if @giving_group.save
        flash[:notice] = 'GivingGroup was successfully created.'
        format.html { redirect_to(@giving_group) }
        format.xml  { render :xml => @giving_group, :status => :created, :location => @giving_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @giving_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /giving_groups/1
  # PUT /giving_groups/1.xml
  def update
    @giving_group = GivingGroup.find(params[:id])

    respond_to do |format|
      if @giving_group.update_attributes(params[:giving_group])
        flash[:notice] = 'GivingGroup was successfully updated.'
        format.html { redirect_to(@giving_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @giving_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /giving_groups/1
  # DELETE /giving_groups/1.xml
  def destroy
    @giving_group = GivingGroup.find(params[:id])
    @giving_group.destroy

    respond_to do |format|
      format.html { redirect_to(giving_groups_url) }
      format.xml  { head :ok }
    end
  end
end
