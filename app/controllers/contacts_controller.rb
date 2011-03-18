class ContactsController < ApplicationController
  before_filter :authorize
  require 'csv'
  rescue_from ActiveRecord::RecordNotFound, :with=> :redirect_if_not_found
  # GET /contacts
  # GET /contacts.xml
  def index
    @search = Contact.search(params[:search] || Contact::DEFAULT_SEARCH_PARAMETERS)
    @contacts = @search.all.paginate(:page => params[:page], :per_page=>25)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.new
    @contact.build_profile_addon
    1.times {@contact.addresses.build}
    1.times {@contact.emails.build}
    1.times {@contact.phones.build}
    
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    
    
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to(@contact) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(@contact)}
        format.xml  { head :ok }
        
      else
        format.html { redirect_to :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end
  
  def csv_import
    @parsed_file=CSV::Reader.parse(params[:dump][:file])
     
      @parsed_file.each do |row|
        newId = row[0]
        if Contact.exists? (newId)
          s = Contact.find(newId)
          s.id = row[0]
          s.issues_remaining = row[3]
          s.update_attributes(params[:contact])
        else
          s = Contact.new
          s.id = row[0]
          s.issues_remaining = row[3]
          s.save
        end
    end
    redirect_to(:action=>"import")
  end
  
  def assign_journals
  contacts = Contact.all
  for contact in contacts
    contact.issues_remaining = contact.issues_remaining
    contact.update_attributes(params[:contact])
  end
  
end

protected

def redirect_if_not_found
  flash[:notice] = 'This Contact cannot be found in the system.  Please refer to the system administrator.'
  redirect_to(:controller=>"admin", :action=>"index")
end

end
