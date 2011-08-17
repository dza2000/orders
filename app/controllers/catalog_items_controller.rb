class CatalogItemsController < ApplicationController
  before_filter :authorize
  # GET /catalog_items
  # GET /catalog_items.xml
  def index
    @catalog_items = CatalogItem.all(:order => 'name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catalog_items }
    end
  end

  # GET /catalog_items/1
  # GET /catalog_items/1.xml
  def show
    @catalog_item = CatalogItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catalog_item }
    end
  end

  # GET /catalog_items/new
  # GET /catalog_items/new.xml
  def new
    @catalog_item = CatalogItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catalog_item }
    end
  end

  # GET /catalog_items/1/edit
  def edit
    @catalog_item = CatalogItem.find(params[:id])
  end

  # POST /catalog_items
  # POST /catalog_items.xml
  def create
    @catalog_item = CatalogItem.new(params[:catalog_item])

    respond_to do |format|
      if @catalog_item.save
        flash[:notice] = 'CatalogItem was successfully created.'
        format.html { redirect_to(@catalog_item) }
        format.xml  { render :xml => @catalog_item, :status => :created, :location => @catalog_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catalog_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catalog_items/1
  # PUT /catalog_items/1.xml
  def update
    @catalog_item = CatalogItem.find(params[:id])

    respond_to do |format|
      if @catalog_item.update_attributes(params[:catalog_item])
        flash[:notice] = 'CatalogItem was successfully updated.'
        format.html { redirect_to(@catalog_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catalog_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_items/1
  # DELETE /catalog_items/1.xml
  def destroy
    @catalog_item = CatalogItem.find(params[:id])
    @catalog_item.destroy

    respond_to do |format|
      format.html { redirect_to(catalog_items_url) }
      format.xml  { head :ok }
    end
  end
end
