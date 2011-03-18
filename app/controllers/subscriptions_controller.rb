class SubscriptionsController < ApplicationController
  before_filter :authorize
  require 'csv'
  # GET /subscriptions
  # GET /subscriptions.xml
  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.xml
  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.xml
  def new
    
    @subscription = Subscription.new(:transaction_id => params[:transaction_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.xml
  def create
    
    @subscription = Subscription.new(params[:subscription])
    @subscription.quantity = @subscription.subscription_type.number_of_issues
    @subscription.unit_cost = @subscription.subscription_type.unit_cost
    
    respond_to do |format|
      if @subscription.save
        flash[:notice] = 'Subscription was successfully created.'
        format.html { redirect_to(@subscription) }
        format.xml  { render :xml => @subscription, :status => :created, :location => @subscription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.xml
  def update
    @subscription = Subscription.find(params[:id])
    
    respond_to do |format|
      
      
      if @subscription.update_attributes(params[:subscription])
        flash[:notice] = 'Subscription was successfully updated.'
        format.html { redirect_to(@subscription) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.xml
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to request.env["HTTP_REFERER"] }
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
        newId = row[11]
        type = row[13]
        
        
        
        
        subscription_type = SubscriptionType.find_by_name(type)
        if Subscription.exists? (newId)
          s = Subscription.find(newId)
          s.id = row[11]
          s.transaction_id = row[11]
          s.contact_id = row[0]
          s.created_at = row[12]
          s.deactivated = 0
          s.quantity = subscription_type.number_of_issues
          s.issues_remaining = subscription_type.number_of_issues
          s.unit_cost = row[14]
          #use row 0 to create a variable newID and compare it to existing contacts
          newId = row[0]
          if Contact.exists?(newId)
            #select contact and compare to new_subscriber and ship_subscriber methods in contact model.
            contact = Contact.find(row[0])
              if contact.new_subscriber or contact.ship_subscriber
                s.new_renewal = "new"
              else
                s.new_renewal = "renewal"
              end
          else
          s.new_renewal = "new"
          end
          s.update_attributes(params[:subscription])
        else
          s = Subscription.new
          s.id = row[11]
          s.transaction_id = row[11]
          s.contact_id = row[0]
          s.deactivated = 0
          s.created_at = row[12]
          s.unit_cost = row[14]
          s.quantity = subscription_type.number_of_issues
          s.issues_remaining = subscription_type.number_of_issues
          s.subscription_name = row[13]
          
          #use row 0 to create a variable newID and compare it to existing contacts
          newId = row[0]
          if Contact.exists?(newId)
            #select contact and compare to new_subscriber and ship_subscriber methods in contact model.
            contact = Contact.find(row[0])
              if contact.new_subscriber or contact.ship_subscriber
                s.new_renewal = "new"
              else
                s.new_renewal = "renewal"
              end
          else
          s.new_renewal = "new"
          end
          
          s.save
      end
      newId = row[11]
      address = Address.find_by_line1(row[4])
      if Transaction.exists? (newId)
        transaction = Transaction.find(newId)
        transaction.id = row[11]
        transaction.contact_id = row[0]
        transaction.created_at = row[12]
        transaction.print = 1
        transaction.address_id = address.id
        transaction.update_attributes(params[:transaction])
      else
        transaction = Transaction.new
        transaction.id = row[11]
        transaction.contact_id = row[0]
        transaction.created_at = row[12]
        transaction.print = 1
        transaction.address_id = address.id
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
 
  
 
end
