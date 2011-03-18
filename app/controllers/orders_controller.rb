class OrdersController < ApplicationController
  before_filter :authorize
  require 'csv'
  rescue_from NoMethodError, :with=>:no_product_error
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new(:transaction_id => params[:transaction_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
  
   def csv_import
      @parsed_file=CSV::Reader.parse(params[:dump][:file])
     
      @parsed_file.each do |row|
        line_1 = row[4]
        if Address.exists? (:line1 => line_1)
          address = Address.find_by_line1(line_1)
          address.line1 = row[4]
          address.line2 = row[5]
          address.city = row[6]
          address.stateAbbrev = row[7]
          address.zip = row[9]
          address.contact_id = row[0]
          address.province = row[8]
          address.countryAbbrev = row[10]
          address.update_attributes(params[:address])
        else
          address = Address.new
          address.line1 = row[4]
          address.line2 = row[5]
          address.city = row[6]
          address.stateAbbrev = row[7]
          address.zip = row[9]
          address.contact_id = row[0]
          address.province = row[8]
          address.countryAbbrev = row[10]
          address.save
        end
        
      newId = row [20]
      if Order.exists? (newId)
        order = Order.find_by_id(newId)
        order.id = row[20]
        order.static_shipping_fee = row[27]
        order.contact_id = row[0]
        order.transaction_id = row[20]
        order.created_at = row[19]
        order.shipping_method = row[29]
        order.ship_to_name = row[11]
        order.ship_to_address_line1 = row[12]
        order.ship_to_address_line2 = row[13]
        order.ship_to_city = row[14]
        order.ship_to_stateAbbrev = row[15]
        order.ship_to_province = row[16]
        order.ship_to_zip = row[17]
        order.ship_to_country = row[18]
        order.update_attributes(params[:order])
      else
        order = Order.new
        order.id = row[20]
        order.static_shipping_fee = row[27]
        order.contact_id = row[0]
        order.transaction_id = row[20]
        order.created_at = row[19]
        order.shipping_method = row[29]
        order.ship_to_name = row[11]
        order.ship_to_address_line1 = row[12]
        order.ship_to_address_line2 = row[13]
        order.ship_to_city = row[14]
        order.ship_to_stateAbbrev = row[15]
        order.ship_to_province = row[16]
        order.ship_to_zip = row[17]
        order.ship_to_country = row[18]
        order.save
      end
      
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
      
      
      newId = row[20]
      address = Address.find_by_line1(row[4])
      if Transaction.exists? (newId)
        transaction = Transaction.find(newId)
        transaction.id = row[20]
        transaction.contact_id = row[0]
        transaction.created_at = row[19]
        transaction.print = 1
        transaction.address_id = address.id
        transaction.source_code = row[31]
        transaction.update_attributes(params[:transaction])
      else
        transaction = Transaction.new
        transaction.id = row[20]
        transaction.contact_id = row[0]
        transaction.created_at = row[19]
        transaction.print = 1
        transaction.address_id = address.id
        transaction.source_code = row[31]
        transaction.save
      end
      newId = row[0]
      if Contact.exists? (newId)
        contact = Contact.find(newId)
        contact.id = row[0]
        contact.first_name = row[2]
        contact.last_name = row[3]
        contact.company_name = row[1]
        contact.update_attributes(params[:contact])
      else
        contact = Contact.new
        contact.id = row[0]
        contact.first_name = row[2]
        contact.last_name = row[3]
        contact.company_name = row[1]
        contact.save
        
      end
      end
      
  redirect_to(:controller=>"admin", :action=>"import")
end

protected

def no_product_error
  flash[:notice] = 'Once again, Don forgot to put in a product.  Call him and let him know.  And smack him next time you see him. :)'
  redirect_to(:controller=>"admin", :action=>"index")
end
end