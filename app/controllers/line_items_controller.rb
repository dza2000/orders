class LineItemsController < ApplicationController
  before_filter :authorize
  require 'csv'
  
  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.xml
  def new
    @line_item = LineItem.new(:order_id => params[:order_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.xml
  def create
    @line_item = LineItem.new(params[:line_item])
    @line_item.price = @line_item.catalog_item.unit_price
    
    respond_to do |format|
      if @line_item.save
        
        flash[:notice] = 'LineItem was successfully created.'
        format.html { redirect_to(@line_item) }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @line_item = LineItem.find(params[:id])
    @line_item.price = @line_item.catalog_item.unit_price
    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        flash[:notice] = 'LineItem was successfully updated.'
        format.html { redirect_to(@line_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @order = @line_item.order
    @line_item.destroy
    
    @order.total = @order.line_items.sum(:line_total)
    @order.update_attribute(:total, @order.total)

    respond_to do |format|
      format.html { redirect_to request.env["HTTP_REFERER"] }
      format.xml  { head :ok }
    end
  end
  
  def csv_import
      @parsed_file=CSV::Reader.parse(params[:dump][:file])
     
      @parsed_file.each do |row|
        quantity = row[24]
        lineAmount = row[25]
        itemCost = lineAmount.to_f / quantity.to_f
              
        newId = row[21]
        if LineItem.exists? (newId)
          l = LineItem.find_by_id(newId)
        
        l.id = row[21]
        l.price = itemCost
        l.quantity = row[24]
        l.order_id = row[20]
        l.line_total = row[25]
        l.created_at = row[19]
        l.sku = row[22]
        l.update_attributes(params[:line_item])
        
        else      
        
        l=LineItem.new
        l.id = row[21]
        l.price = itemCost
        l.quantity = row[24]
        l.order_id = row[20]
        l.line_total = row[25]
        l.sku = row[22]
               
        l.save
        
    end
  end
  redirect_to(:controller=>"admin", :action=>"import")
end


end