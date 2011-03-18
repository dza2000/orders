class ProfileAddonsController < ApplicationController
  before_filter :authorize
  # GET /profile_addons
  # GET /profile_addons.xml
  def index
    @profile_addons = ProfileAddon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_addons }
    end
  end

  # GET /profile_addons/1
  # GET /profile_addons/1.xml
  def show
    @profile_addon = ProfileAddon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_addon }
    end
  end

  # GET /profile_addons/new
  # GET /profile_addons/new.xml
  def new
    @profile_addon = ProfileAddon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_addon }
    end
  end

  # GET /profile_addons/1/edit
  def edit
    @profile_addon = ProfileAddon.find(params[:id])
  end

  # POST /profile_addons
  # POST /profile_addons.xml
  def create
    @profile_addon = ProfileAddon.new(params[:profile_addon])

    respond_to do |format|
      if @profile_addon.save
        flash[:notice] = 'ProfileAddon was successfully created.'
        format.html { redirect_to(@profile_addon) }
        format.xml  { render :xml => @profile_addon, :status => :created, :location => @profile_addon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_addon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_addons/1
  # PUT /profile_addons/1.xml
  def update
    @profile_addon = ProfileAddon.find(params[:id])

    respond_to do |format|
      if @profile_addon.update_attributes(params[:profile_addon])
        flash[:notice] = 'ProfileAddon was successfully updated.'
        format.html { redirect_to(@profile_addon) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_addon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_addons/1
  # DELETE /profile_addons/1.xml
  def destroy
    @profile_addon = ProfileAddon.find(params[:id])
    @profile_addon.destroy

    respond_to do |format|
      format.html { redirect_to(profile_addons_url) }
      format.xml  { head :ok }
    end
  end
end
