class TransactionsController < ApplicationController
  before_filter :authorize
  require 'prawn'
  require 'prawnto'
  require 'csv'
  
  
  # GET /transactions
  # GET /transactions.xml
  def index
    @search = Transaction.search(params[:search] || Contact::DEFAULT_SEARCH_PARAMETERS)
    @transactions = @search.all.paginate(:page=>params[:page], :per_page=>25)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
      format.pdf { render :layout => false}
        
      
    end
  end

  # GET /transactions/new
  # GET /transactions/new.xml
  def new
     
    @transaction = Transaction.new(:contact_id => params[:contact_id])
           
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.xml
  def create
    
    @transaction = Transaction.new(params[:transaction])
    
    respond_to do |format|
      if @transaction.save
        flash[:notice] = 'Transaction was successfully created.'
        format.html {redirect_to (edit_contact_transaction_path(:contact_id=>@transaction.contact_id, :id=> @transaction.id))}
      else
        render :action => 'new'
    end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.xml
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction]) 
        flash[:notice] = 'Transaction was successfully updated.'
        format.html { redirect_to(@transaction) }
        format.xml  { head :ok }
      
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.xml
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(transactions_url) }
      format.xml  { head :ok }
    end
  end
  
  def printing
    #find all transactions that need printing
    @transactions = Transaction.find(:all, :conditions => ["print = 1" ])
    
    
    @transactions.each do |transaction|
      #Initialize Prawn PDF maker
      pdf = Prawn::Document.new
      pdf.move_down(75)
      
      
      #check to see if this is an estore order
      if transaction.orders.size >= 1
      ordertopsticker = transaction.orders.find(:first)
      
      #If there is a ship to address, such as a gift...
      if ordertopsticker.ship_to_name 
        pdf.draw_text "#{ordertopsticker.ship_to_name}", :at => [310, 632]
        pdf.draw_text "#{ordertopsticker.ship_to_address_line1}", :at => [310, 620]
        pdf.draw_text "#{ordertopsticker.ship_to_address_line2}", :at => [310, 608]
        pdf.draw_text "#{ordertopsticker.ship_to_city}, #{ordertopsticker.ship_to_stateAbbrev}  #{ordertopsticker.ship_to_province} #{ordertopsticker.ship_to_zip}", :at => [310, 596]
        
      else
        #Otherwise, take the owner of the transaction and send it to their address.
      pdf.draw_text "#{transaction.contact.first_name} #{transaction.contact.last_name}", :at => [310, 632]
      if transaction.address_id == 0 or transaction.address.nil?
      else
      pdf.draw_text "#{transaction.address.line1}", :at => [310, 620]
      if transaction.address.line2.nil?
       pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}", :at => [310, 608] 
     else
      pdf.draw_text "#{transaction.address.line2}", :at => [310, 608]
      pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}", :at => [310, 596]
      
    end
    end
  end
else
  pdf.draw_text "#{transaction.contact.first_name} #{transaction.contact.last_name}", :at => [310, 632]
      if transaction.address_id == 0 or transaction.address.nil?
      else
      pdf.draw_text "#{transaction.address.line1}", :at => [310, 620]
      if transaction.address.line2.nil?
       pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}", :at => [310, 608] 
     else
      pdf.draw_text "#{transaction.address.line2}", :at => [310, 608]
      pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}", :at => [310, 596]
    end
  end
end

      pdf.move_down(15)
      
      pdf.draw_text "Supporter ID", :style => :bold, :at =>[310, 550], :size => 10
      pdf.draw_text "Order ID", :style => :bold, :at =>[400, 550], :size => 10
      pdf.draw_text "Date", :style => :bold, :at =>[490, 550], :size => 10
      pdf.move_down(5)
      pdf.draw_text "#{transaction.contact_id}", :at => [310, 536], :size => 10
      pdf.draw_text "#{transaction.id}", :at => [400, 536], :size => 10
      pdf.draw_text "#{transaction.formatted_date}", :at => [490, 536], :size => 10
      pdf.move_down(30)
      pdf.draw_text "#{transaction.contact.first_name} #{transaction.contact.last_name}",:size => 10, :at => [10, 615]
      if transaction.address_id == 0
      else
      pdf.draw_text "#{transaction.address.line1}",:size => 10, :at => [10, 605]
      if transaction.address.line2.nil?
       pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}",:size => 10, :at => [10, 590] 
     else
      pdf.draw_text "#{transaction.address.line2}",:size => 10, :at => [10, 590]
      pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}",:size => 10, :at => [10, 580]
      end
    end
    pdf.move_down(50)
    if transaction.orders.size >= 1
    
    
    pdf.text "Order Details", :size => 10, :style => :bold
    transaction.orders.each do |order|      
    pdf.move_down(10)
    pdf.text "Shipping Address", :size => 10
    if order.ship_to_name
    pdf.text "#{order.ship_to_name}"
    pdf.text "#{order.ship_to_address_line1}"
    pdf.text "#{order.ship_to_address_line2}"
    pdf.text "#{order.ship_to_city}, #{order.ship_to_stateAbbrev}  #{order.ship_to_province} #{order.ship_to_zip}"
    pdf.text "#{order.ship_to_country}"
  else
    end
    pdf.move_down(10)
    items = order.line_items.map do |item|
      [item.sku,
       item.catalog_item.name,
       item.formatted_price,
       item.quantity]
     end
     pdf.table items,
     :font_size => 8,
     :border_style => :none,
     :row_colors => ["FFFFFF", "DDDDDD"],
     :headers => ["SKU", "Product Name", "Price", "Quantity"]
     pdf.move_down(10)
     pdf.text "Total Order Price: #{order.formatted_price}"
     pdf.move_down (10)
     pdf.text "#{order.shipping_method}", :size => 14, :style => :bold
     pdf.move_down (10)
     pdf.text "#{transaction.source_code}"
   end
   end
   pdf.move_down(10)
   if transaction.donations.size >= 1
     pdf.text "Donation Details", :size => 10, :style => :bold
     
     transaction.donations.each do |donation|
   donation_items = donation.donation_lines.map do |donation_item|   
     [donation_item.formatted_price,
      donation_item.name,
      donation_item.sku]
    end
    pdf.table donation_items,
    :font_size => 8,
    :border_width => 0,
    :align => :right,
    :row_colors => ["FFFFFF", "DDDDDD"],
    :headers => ["Amount","Donation Initiative", "sku"]
    pdf.move_down(5)
	
	donation.donation_lines.each do |donation_line|
    pdf.text "Personalized To:  #{donation_line.personalized_to}", :size => 8
    
    pdf.text "Inscription:  #{donation_line.inscription}", :size => 8
	pdf.move_down(10)
	if donation_line.ship_to_address_line1?	
	pdf.text "Ship To:"
	pdf.text "#{donation_line.ship_to_first_name} #{donation_line.ship_to_last_name}"
	pdf.text "#{donation_line.ship_to_address_line1}"
	pdf.text "#{donation_line.ship_to_address_line2}"
	pdf.text "#{donation_line.ship_to_city}, #{donation_line.ship_to_state} #{donation_line.ship_to_province} #{donation_line.ship_to_zip_code}"
	else
	pdf.text "Ship To:"
	pdf.text "#{transaction.contact.first_name} #{transaction.contact.last_name}"
	pdf.text "#{transaction.address.line1}"
	pdf.text "#{transaction.address.line2}"
	pdf.text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}"
	end
	pdf.move_down(10)
	
   end
   end
 end
 pdf.move_down(10)
 #if the transaction has a subscription, determine whether or not we need to send the issue to the person or if it is simply a renewal.
 if transaction.subscriptions.size >= 1 and (transaction.contact.new_subscriber or transaction.contact.ship_subscriber)
   pdf.text "Journal Details", :size => 10, :style => :bold
   if transaction.contact.new_subscriber or transaction.contact.ship_subscriber
     published_issue = PublishedIssue.find(:first, :order=>"id DESC")
     pdf.text "#{published_issue.sku} #{published_issue.name}", :size => 8
     pdf.move_down(20)
     pdf.text "Ship Issue", :size => 8
    else 
     
   end
 end
 pdf.draw_text "#{transaction.contact.first_name} #{transaction.contact.last_name}", :at => [50, 130]
      if transaction.address_id == 0
      else
      pdf.draw_text "#{transaction.address.line1}", :at => [50, 120]
      if transaction.address.line2.nil?
       pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}", :at => [50, 110] 
     else
      pdf.draw_text "#{transaction.address.line2}", :at => [50, 110]
      pdf.draw_text "#{transaction.address.city}, #{transaction.address.stateAbbrev} #{transaction.address.zip}", :at => [50, 100]
      end
    end
    
 pdf.draw_text "#{transaction.gen_source_code}", :at => [310, 130]   
 pdf.draw_text "___ Sign me up to receive the CRI e-newsletter.       Email Address:__________________", :at => [175, 55], :size => 10
 
 
    
    pdf.draw_text "Transaction Total:  #{transaction.formatted_price}", :at=>[310,300], :size => 14, :style => :bold
            
      pdf.render_file "public/pdfs/#{transaction.id}.pdf"
      
      if transaction.subscriptions.size >= 1 and !(transaction.contact.new_subscriber or transaction.contact.ship_subscriber) 
     File.delete("public/pdfs/#{transaction.id}.pdf") 
     end
     
     transaction.update_attribute(:print, 0) 
   
   if transaction.subscriptions.size >=1 and (transaction.contact.new_subscriber or transaction.contact.ship_subscriber)
   published_issue = PublishedIssue.find(:last)
   subscription = transaction.subscriptions.find(:first)
   contact = subscription.contact
   received_issue = ReceivedIssue.new
   received_issue.contact_id = transaction.contact_id
   received_issue.subscription_id = subscription.id
   received_issue.published_issue_id = published_issue.id
   received_issue.save
   issues_remaining = subscription.issues_remaining
   subscription.issues_remaining = issues_remaining - 1
   contact.issues_remaining = issues_remaining - 1
   subscription.update_attributes(params[:subscription])
   contact.update_attributes(params[:subscription])
   
 elsif transaction.subscriptions.size >=1 and !(transaction.contact.new_subscriber or transaction.contact.ship_subscriber)
   contact = transaction.contact
   subscriptions = contact.subscriptions.find(:all)
   contact.issues_remaining = contact.subscriptions.sum(:issues_remaining)
   contact.update_attributes(params[:contact])
   else
   
 end
 
   end
   flash[:notice] = 'Transactions have been successfully printed.' 
   redirect_to(:controller=>"admin", :action=>"index")
        
    end
    
    def prints
      @transactions = Transaction.find(:all, :conditions => ["print = 1" ])
      @transactions.each do |transaction|
        
      end
    end
    
    def csv_import
      @parsed_file=CSV::Reader.parse(params[:dump][:file])
     
      @parsed_file.each do |row|
        t=Transaction.new
        t.id = row[0]
        t.staff_id = row[1]
        t.ship = row[2]
        t.source_code = row[3]
        t.contact_id = row[4]
        t.created_at = row[5]
        t.updated_at = row[6]
        t.source_code_id = row[7]
        t.address_id = row[8]
        t.print = row[9]
        
        t.save
      end
    end
	
end
