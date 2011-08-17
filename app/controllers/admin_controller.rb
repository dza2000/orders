class AdminController < ApplicationController
  before_filter :authorize, :only => :index
  

  require 'fastercsv'
  def login
    if request.post?
      staff = Staff.find_by_username_and_password(params[:username], params[:password])
      if staff
        session[:staff_id] = staff.id
        redirect_to(:controller=>"admin", :action=>"index")
      else
        flash.now[:notice] = "Invalid user/password combination"
        params[:password] = nil
      end
    end
  end

  def logout
    session[:staff_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to(:action => "login")
  end

def assign_journals
  contacts = Contact.all
  for contact in contacts
    contact.issues_remaining = contact.issues_remaining
    update_attributes(params[:contact])
  end
  
end
  def index
   contacts = Contact.all(:conditions => ['issues_remaining > 0'])
   subscriptions = Subscription.all(:conditions => ['issues_remaining > 0'])
   @contacts = contacts
   @subscriptions = subscriptions
   
   
 end
 
 def journal_pull
   #find all contacts with issues remaining in their subscriptions
   contacts = Contact.all(:conditions => ['issues_remaining > 0'], :select=>"id, issues_remaining")
   #find the latest published issue
   published_issue = PublishedIssue.find(:first, :order=>"id DESC")
   
   contacts.each do |contact|
     #assign subscription to the oldest subscription owned by the contact that still has issues remaining and has not been deactivated.
     subscription = contact.subscriptions.find(:first, :conditions => ['issues_remaining > 0 and deactivated = 0'] )
     
    
    if subscription.nil?
      else
    
       #create a received issue for the subscription and the contact
       received_issue = ReceivedIssue.new
       received_issue.subscription_id = subscription.id
       received_issue.published_issue_id = published_issue.id
       received_issue.contact_id = contact.id
       received_issue.save
       
       #update the subscription's issues remaining
       subscription.issues_remaining = subscription.quantity - subscription.received_issues.count
       subscription.update_attributes(params[:subscription])
       #update the contact's issues remaining
       contact.issues_remaining = contact.subscriptions.sum(:quantity) - contact.received_issues.count
       contact.update_attributes(params[:contact])
    end
   end
   flash[:notice] = "Journal Pull prepared."
   redirect_to(:action=>"index")
 end
 
 def final_report
   #define variable for the latest published issue
  published_issue = PublishedIssue.find(:first, :order=>"id DESC")
  #find all received issues that have that issue as their published issue
  @received_issues = ReceivedIssue.find_all_by_published_issue_id(published_issue)
  
  @outfile = "journalpull" + Time.now.strftime("%Y-%m-%d") + ".csv"
 csv_data = FasterCSV.generate do |csv|
   csv << [
   "ID",
   "First Name",
   "Last Name",
   "Company Name",
   "Address Line1",
   "Address Line2",
   "City",
   "State",
   "Province",
   "Zip Code",
   "Country"
   ]
   
   @received_issues.each do |received_issue|
     #defines contact and address- Contact is the owner of the received issue
     contact = received_issue.contact
     address = contact.addresses.find(:first)
     
     #if the subscription has an address other than the contact's address:
     if received_issue.subscription.transaction.address
     csv<< [
     received_issue.contact.id,
     received_issue.contact.first_name,
     received_issue.contact.last_name,
     received_issue.contact.company_name,
     received_issue.subscription.transaction.address.line1,
     received_issue.subscription.transaction.address.line2,
     received_issue.subscription.transaction.address.city,
     received_issue.subscription.transaction.address.stateAbbrev,
     received_issue.subscription.transaction.address.province,
     received_issue.subscription.transaction.address.zip,
     received_issue.subscription.transaction.address.countryAbbrev
     ]
   else
     #assigns the received issue the contact's information
     csv<< [
     received_issue.contact.id,
     received_issue.contact.first_name,
     received_issue.contact.last_name,
     received_issue.contact.company_name,
     address.line1,
     address.line2,
     address.city,
     address.stateAbbrev,
     address.province,
     address.zip,
     address.countryAbbrev
     ]
     
     end
 end
end
#sends the data to a file for saving and sending.
send_data(csv_data, :type => 'text/csv;charset=utf-8;header=present', :filename =>"#{@outfile}")
 end
 
 


def printing
  @line_items = LineItem.find(:all, :conditions=>["needs_reprinting = 1"])
  @donation_lines = DonationLine.find(:all, :conditions=>["needs_reprinting = 1"])
  @subscriptions = Subscription.find(:all, :conditions=>["needs_reprinting = 1"])
  
  @line_items.each do |line_item|
    pdf = Prawn::Document.new
      pdf.move_down(75)
      pdf.draw_text "#{line_item.order.contact.first_name} #{line_item.order.contact.last_name}", :at => [310, 632]
      if line_item.order.transaction.address_id == 0 or line_item.order.transaction.address.line1 == ""
        pdf.draw_text "#{line_item.order.contact.address.line1}", :at =>[310, 620]
        pdf.draw_text "#{line_item.order.contact.address.line2}", :at =>[310, 608]
        pdf.draw_text "#{line_item.order.contact.address.city}, #{line_item.order.contact.address.stateAbbrev} #{line_item.order.contact.address.zip}", :at => [310, 596]
      else
      pdf.draw_text "#{line_item.order.transaction.address.line1}", :at => [310, 620]
      if line_item.order.transaction.address.line2.nil?
       pdf.draw_text "#{line_item.order.transaction.address.city}, #{line_item.order.transaction.address.stateAbbrev} #{line_item.order.transaction.address.zip}", :at => [310, 608] 
     else
      pdf.draw_text "#{line_item.order.transaction.address.line2}", :at => [310, 608]
      pdf.draw_text "#{line_item.order.transaction.address.city}, #{line_item.order.transaction.address.stateAbbrev} #{line_item.order.transaction.address.province} #{line_item.order.transaction.address.zip}", :at => [310, 596]
      pdf.draw_text "#{line_item.order.transaction.address.countryAbbrev} ", :at=> [310, 588]
      end
      end
      pdf.move_down(15)
      pdf.draw_text "Supporter ID", :style => :bold, :at =>[310, 550], :size => 10
      pdf.draw_text "Order ID", :style => :bold, :at =>[400, 550], :size => 10
      pdf.draw_text "Date", :style => :bold, :at =>[490, 550], :size => 10
      pdf.move_down(5)
      pdf.draw_text "#{line_item.order.contact_id}", :at => [310, 536], :size => 10
      pdf.draw_text "#{line_item.order.transaction.id}", :at => [400, 536], :size => 10
      pdf.draw_text "#{line_item.order.transaction.formatted_date}", :at => [490, 536], :size => 10
      pdf.move_down(30)
      pdf.draw_text "#{line_item.order.contact.first_name} #{line_item.order.contact.last_name}",:size => 10, :at => [10, 615]
      if line_item.order.transaction.address_id == 0
      else
      pdf.draw_text "#{line_item.order.transaction.address.line1}",:size => 10, :at => [10, 605]
      if line_item.order.transaction.address.line2.nil?
       pdf.draw_text "#{line_item.order.transaction.address.city}, #{line_item.order.transaction.address.stateAbbrev} #{line_item.order.transaction.address.zip}",:size => 10, :at => [10, 590] 
     else
      pdf.draw_text "#{line_item.order.transaction.address.line2}",:size => 10, :at => [10, 590]
      pdf.draw_text "#{line_item.order.transaction.address.city}, #{line_item.order.transaction.address.stateAbbrev} #{line_item.order.transaction.address.province} #{line_item.order.transaction.address.zip}",:size => 10, :at => [10, 580]
      pdf.draw_text "#{line_item.order.transaction.address.countryAbbrev}", :size=> 10, :at => [10, 570]
      end
    end
    pdf.move_down(50)
    pdf.text "Reship Details", :size => 10, :style => :bold
          
    
    items = @line_items.map do |item|
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
     pdf.text "Total Order Price: #{line_item.order.formatted_price}"
     pdf.move_down(10)
     pdf.text "#{line_item.order.shipping_method}", :size => 14, :style => :bold
 
 pdf.draw_text "#{line_item.order.contact.first_name} #{line_item.order.contact.last_name}", :at => [50, 130]
      if line_item.order.transaction.address_id == 0
      else
      pdf.draw_text "#{line_item.order.transaction.address.line1}", :at => [50, 120]
      if line_item.order.transaction.address.line2.nil?
       pdf.draw_text "#{line_item.order.transaction.address.city}, #{line_item.order.transaction.address.stateAbbrev} #{line_item.order.transaction.address.zip}", :at => [50, 110] 
     else
      pdf.draw_text "#{line_item.order.transaction.address.line2}", :at => [50, 110]
      pdf.draw_text "#{line_item.order.transaction.address.city}, #{line_item.order.transaction.address.stateAbbrev} #{line_item.order.transaction.address.zip}", :at => [50, 100]
      end
    end
  
  pdf.render_file "public/pdfs/line_items/#{line_item.id}.pdf"
line_item.update_attribute(:needs_reprinting, 0)
end

@donation_lines.each do |donation_line|
  pdf = Prawn::Document.new
      pdf.move_down(75)
      pdf.draw_text "#{donation_line.donation.contact.first_name} #{donation_line.donation.contact.last_name}", :at => [310, 632]
      
      pdf.draw_text "#{donation_line.donation.transaction.address.line1}", :at => [310, 620]
      if donation_line.donation.transaction.address.line2.nil?
       pdf.draw_text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}", :at => [310, 608] 
     else      pdf.draw_text "#{donation_line.donation.transaction.address.line2}", :at => [310, 608]
      pdf.draw_text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}", :at => [310, 596]
      
      end
      pdf.move_down(15)
      pdf.draw_text "Supporter ID", :style => :bold, :at =>[310, 550], :size => 10
      pdf.draw_text "Order ID", :style => :bold, :at =>[400, 550], :size => 10
      pdf.draw_text "Date", :style => :bold, :at =>[490, 550], :size => 10
      pdf.move_down(5)
      pdf.draw_text "#{donation_line.donation.contact_id}", :at => [310, 536], :size => 10
      pdf.draw_text "#{donation_line.donation.transaction.id}", :at => [400, 536], :size => 10
      pdf.draw_text "#{donation_line.donation.transaction.formatted_date}", :at => [490, 536], :size => 10
      pdf.move_down(30)
      pdf.draw_text "#{donation_line.donation.contact.first_name} #{donation_line.donation.contact.last_name}",:size => 10, :at => [10, 615]
      if donation_line.donation.transaction.address_id == 0 or donation_line.donation.transaction.address.nil?
      else
      pdf.draw_text "#{donation_line.donation.transaction.address.line1}",:size => 10, :at => [10, 605]
      if donation_line.donation.transaction.address.line2.nil?
       pdf.draw_text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}",:size => 10, :at => [10, 590] 
     else
      pdf.draw_text "#{donation_line.donation.transaction.address.line2}",:size => 10, :at => [10, 590]
      pdf.draw_text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}",:size => 10, :at => [10, 580]
      end
    end
    pdf.move_down(50)
    pdf.text "Reship Details", :size => 10, :style => :bold
    donation_items = @donation_lines.map do |donation_item|   
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
  
  @donation_lines.each do |donation_line|
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
  pdf.text "#{donation_line.donation.transaction.contact.first_name} #{donation_line.donation.transaction.contact.last_name}"
  if donation_line.donation.transaction.address.nil?
    else
  pdf.text "#{donation_line.donation.transaction.address.line1}"
  pdf.text "#{donation_line.donation.transaction.address.line2}"
  pdf.text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}"
  end
  end
  pdf.move_down(10)
  
   end

pdf.draw_text "#{donation_line.donation.contact.first_name} #{donation_line.donation.contact.last_name}", :at => [50, 130]
      if donation_line.donation.transaction.address_id == 0 or donation_line.donation.transaction.address.nil?
      else
      pdf.draw_text "#{donation_line.donation.transaction.address.line1}", :at => [50, 120]
      if donation_line.donation.transaction.address.line2.nil?
       pdf.draw_text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}", :at => [50, 110] 
     else
      pdf.draw_text "#{donation_line.donation.transaction.address.line2}", :at => [50, 110]
      pdf.draw_text "#{donation_line.donation.transaction.address.city}, #{donation_line.donation.transaction.address.stateAbbrev} #{donation_line.donation.transaction.address.zip}", :at => [50, 100]
      end
    end

pdf.render_file "public/pdfs/line_items/#{donation_line.id}.pdf"
donation_line.update_attribute(:needs_reprinting, 0)
  
end

@subscriptions.each do |subscription|
  pdf = Prawn::Document.new
      pdf.move_down(75)
      pdf.draw_text "#{subscription.contact.first_name} #{subscription.contact.last_name}", :at => [310, 632]
      if subscription.transaction.address_id == 0 or subscription.transaction.address.line1=="" or subscription.transaction.address.nil?
      address = subscription.contact.addresses.find(:first)
      pdf.draw_text "#{address.line1}", :at =>[310, 620]
        pdf.draw_text "#{address.line2}", :at =>[310, 608]
        if address.province
           pdf.draw_text "#{address.city}, #{address.province} #{address.zip}", :at => [310, 596]
           pdf.draw_text "#{address.countryAbbrev}", :at => [310, 588]
      else
         pdf.draw_text "#{address.city}, #{address.stateAbbrev} #{address.zip}", :at => [310, 596]
      
        end
        
      
      else
      pdf.draw_text "#{subscription.transaction.address.line1}", :at => [310, 620]
      if subscription.transaction.address.line2.nil?
       pdf.draw_text "#{subscription.transaction.address.city}, #{subscription.transaction.address.stateAbbrev} #{subscription.transaction.address.zip}", :at => [310, 608] 
     else
      pdf.draw_text "#{subscription.transaction.address.line2}", :at => [310, 608]
      pdf.draw_text "#{subscription.transaction.address.city}, #{subscription.transaction.address.stateAbbrev} #{subscription.transaction.address.zip}", :at => [310, 596]
      end
      end
      pdf.move_down(15)
      pdf.draw_text "Supporter ID", :style => :bold, :at =>[310, 550], :size => 10
      pdf.draw_text "Order ID", :style => :bold, :at =>[400, 550], :size => 10
      pdf.draw_text "Date", :style => :bold, :at =>[490, 550], :size => 10
      pdf.move_down(5)
      pdf.draw_text "#{subscription.contact_id}", :at => [310, 536], :size => 10
      pdf.draw_text "#{subscription.transaction.id}", :at => [400, 536], :size => 10
      pdf.draw_text "#{subscription.transaction.formatted_date}", :at => [490, 536], :size => 10
      pdf.move_down(30)
      pdf.draw_text "#{subscription.contact.first_name} #{subscription.contact.last_name}",:size => 10, :at => [10, 615]
      if subscription.transaction.address_id == 0 or subscription.transaction.address.nil?
      else
      pdf.draw_text "#{subscription.transaction.address.line1}",:size => 10, :at => [10, 605]
      if subscription.transaction.address.line2.nil?
       pdf.draw_text "#{subscription.transaction.address.city}, #{subscription.transaction.address.stateAbbrev} #{subscription.transaction.address.zip}",:size => 10, :at => [10, 590] 
     else
      pdf.draw_text "#{subscription.transaction.address.line2}",:size => 10, :at => [10, 590]
      pdf.draw_text "#{subscription.transaction.address.city}, #{subscription.transaction.address.stateAbbrev} #{subscription.transaction.address.zip}",:size => 10, :at => [10, 580]
      end
    end
    pdf.move_down(50)
    pdf.text "Reship Details", :size => 10, :style => :bold
    
    pdf.text "#{subscription.reship_details}"
     pdf.move_down(20)
     pdf.text "Ship Issue(s)", :size => 8
     
     pdf.render_file "public/pdfs/line_items/#{subscription.id}.pdf"
subscription.update_attribute(:needs_reprinting, 0)
    
  end
  flash[:notice] = 'Reprints have been successfully completed.'
  redirect_to(:action=>"index")
end

def merge
  #define the merge from contact.
  contact1 = Contact.find(params[:contact1])
  #define the merge to contact.
  contact2 = Contact.find(params[:contact2])
  
  
  #start with the transactions.
  if contact1.transactions.size > 0
  contact1.transactions.each do |transaction|
    transaction.update_attribute(:contact_id, contact2.id)
  end
  end
  #then change any donations.
  if contact1.donations.size > 0
    contact1.donations.each do |donation|
      donation.update_attribute(:contact_id, contact2.id)
    end
  end
  #now for the subscriptions.
  if contact1.subscriptions.size > 0
    contact1.subscriptions.each do |subscription|
      subscription.update_attribute(:contact_id, contact2.id)
    end
    end
  if contact1.received_issues.size > 0
  contact1.received_issues.each do |issue|
      issue.update_attribute(:contact_id, contact2.id)
    end
    end
  #and finally, orders.
  if contact1.orders.size > 0
    contact1.orders.each do |order|
      order.update_attribute(:contact_id, contact2.id)
    end
  end
  #now, grab the primary address of contact2.
  address = contact2.addresses.all(:conditions=>"is_primary = true")
  contact2.transactions.each do |transaction|
    transaction.update_attribute(:address_id, address.id)
  end
  

#Congrats, you merged the accounts.
  flash[:notice] = "You merged #{contact1.id} and #{contact2.id}."
  contact1.destroy
  
  redirect_to :controller=>"contacts", :action=>"show", :id=>contact2.id
end

end
