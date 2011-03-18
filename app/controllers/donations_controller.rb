class DonationsController < ApplicationController
  require 'csv'
  before_filter :authorize
  rescue_from NoMethodError, :with => :no_donation_product
  # GET /donations
  # GET /donations.xml
  def index
    @search = Donation.search(params[:search] || Contact::DEFAULT_SEARCH_PARAMETERS)
    @donations = @search.all.paginate(:page=>params[:page], :per_page=>25)
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.xml
  def show
    @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.xml
  def new
     
    @donation = Donation.new(:transaction_id => params[:transaction_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.xml
  def create
    @donation = Donation.new(params[:donation])

    respond_to do |format|
      if @donation.save
        flash[:notice] = 'Donation was successfully created.'
        format.html { redirect_to(@donation) }
        format.xml  { render :xml => @donation, :status => :created, :location => @donation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.xml
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        flash[:notice] = 'Donation was successfully updated.'
        format.html { redirect_to(@donation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.xml
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to(donations_url) }
      format.xml  { head :ok }
    end
  end
  
  def csv_import
      @parsed_file=CSV::Reader.parse(params[:dump][:file])
     
      @parsed_file.each do |row|
        line1 = row[3]
        if Address.exists? (:line1 => line1)
          address = Address.find_by_line1(line1)
          address.contact_id = row[0]
          address.line1 = row[3]
          address.line2 = row[4]
          address.city = row[5]
          address.stateAbbrev = row[6]
          address.province = row[7]
          address.zip = row[8]
          address.countryAbbrev = row[9]
          address.update_attributes(params[:address])
        else
          address = Address.new
          address.contact_id = row[0]
          address.line1 = row[3]
          address.line2 = row[4]
          address.city = row[5]
          address.stateAbbrev = row[6]
          address.province = row[7]
          address.zip = row[8]
          address.countryAbbrev = row[9]
          address.save
        end
        
        newId = row[0]
        if Contact.exists? (newId)
          c = Contact.find(newId)
          c.id = row[0]
          c.first_name = row[2]
          c.last_name = row[1]
          c.update_attributes(params[:contact])
        else
          c = Contact.new
          c.id = row[0]
          c.first_name = row[2]
          c.last_name = row[1]
          c.save
        end
        
        
        initiative = Initiative.find_by_name(row[13])
        
        newId = row[10]
        address = Address.find_by_line1(row[3])
        if Transaction.exists? (row[10])
          t = Transaction.find_by_id(newId)
          t.contact_id = row[0]
          t.id = row[10]
          t.created_at = row[11]
          
          if initiative.needs_printing == true
          t.print = "1"
        else
          t.print = "0"
        end
          t.address_id = address.id
          t.update_attributes(params[:transaction])
        else
          t = Transaction.new
          t.contact_id = row[0]
          t.id = row[10]
          t.created_at = row[11]
          
          if initiative.needs_printing == true
          t.print = "1"
        else
          t.print = "0"
        end
          t.address_id = address.id
          t.save
          
        end
        newId = row[10]
        
        if Donation.exists? (row[10])
          d= Donation.find_by_id(newId)
          d.contact_id = row[0]
        d.ship = row[7]
        d.id = row[10]
        d.transaction_id = row[10]
        d.created_at = row[11]
        d.donation_amount = row[12]
        d.recurring = row[14]
        d.update_attributes(params[:donation])
        else
         d=Donation.new
        d.contact_id = row[0]
        d.ship = row[7]
        d.id = row[10]
        d.transaction_id = row[10]
        d.created_at = row[11]
        d.donation_amount = row[12]
        d.recurring = row[14]
        d.save 
        end
        
        newId = row[10]
        
        if DonationLine.exists? (newId)
          dl = DonationLine.find(newId)
          dl.id = row[10]
          dl.name = row[13]
          dl.created_at = row[11]
          dl.donation_id = row[10]
          dl.donation_amount = row[12]
          dl.update_attributes(params[:donation_line])
        else
          dl = DonationLine.new
          dl.id = row[10]
          dl.name = row[13]
          dl.created_at = row[11]
          dl.donation_id = row[10]
          dl.donation_amount = row[12]
          dl.save
          end
        
        
    end
    
      redirect_to(:controller=>"admin", :action=>"import")
    end
   
    protected
    
    def no_donation_product
      flash[:notice]='Call Don.  He probably forgot to put in a new donation product.  Smack him next time you see him. :)'
      redirect_to(:controller=>"admin", :action=>"index")
    end
  end
  
 
 
  

