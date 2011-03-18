class DonationLinesController < ApplicationController
  before_filter :authorize
  # GET /donation_lines
  # GET /donation_lines.xml
  def index
    @donation_lines = DonationLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donation_lines }
    end
  end

  # GET /donation_lines/1
  # GET /donation_lines/1.xml
  def show
    @donation_line = DonationLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation_line }
    end
  end

  # GET /donation_lines/new
  # GET /donation_lines/new.xml
  def new
    @donation_line = DonationLine.new(:donation_id => params[:donation_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation_line }
    end
  end

  # GET /donation_lines/1/edit
  def edit
    @donation_line = DonationLine.find(params[:id])
  end

  # POST /donation_lines
  # POST /donation_lines.xml
  def create
    
    @donation_line = DonationLine.new(params[:donation_line])
    
                respond_to do |format|
      if @donation_line.save
        
        format.html { redirect_to @donation_line }
        format.xml  { render :xml => @donation_line, :status => :created, :location => @donation_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donation_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donation_lines/1
  # PUT /donation_lines/1.xml
  def update
    @donation_line = DonationLine.find(params[:id])

    respond_to do |format|
      if @donation_line.update_attributes(params[:donation_line])
        flash[:notice] = 'DonationLine was successfully updated.'
        format.html { redirect_to request.referrer }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_lines/1
  # DELETE /donation_lines/1.xml
  def destroy
    @donation_line = DonationLine.find(params[:id])
    @donation = @donation_line.donation
    @donation_line.destroy
    
    @donation.donation_amount = @donation.donation_lines.sum(:donation_amount)
    @donation.update_attribute(:donation_amount, @donation.donation_amount)
          
    respond_to do |format|
      format.html { redirect_to request.env["HTTP_REFERER"] }
      format.xml  { head :ok }
    end
  end
  
  def csv_import
      @parsed_file=CSV::Reader.parse(params[:dump][:file])
     
      @parsed_file.each do |row|
        newId = row[1]
        if DonationLine.exists?(newId)
        dl=DonationLine.find(newId)
        dl.id = row[1]
        dl.personalized_to = row[2]
        dl.inscription = row[3]
        dl.quantity = row[17]
        dl.ship_to_first_name = row[8]
        dl.ship_to_last_name = row[9]
        dl.ship_to_address_line1 = row[10]
        dl.ship_to_address_line2 = row[11]
        dl.ship_to_city = row[12]
        dl.ship_to_state = row[13]
        dl.ship_to_province = row[14]
        dl.ship_to_zip_code = row[15]
        dl.ship_to_country = row [16]
        dl.update_attributes(params[:donation_line])
      else
        dl = DonationLine.new
        dl.id = row[1]
        dl.personalized_to = row[2]
        dl.inscription = row[3]
        dl.quantity = row[17]
        dl.ship_to_first_name = row[8]
        dl.ship_to_last_name = row[9]
        dl.ship_to_address_line1 = row[10]
        dl.ship_to_address_line2 = row[11]
        dl.ship_to_city = row[12]
        dl.ship_to_state = row[13]
        dl.ship_to_province = row[14]
        dl.ship_to_zip_code = row[15]
        dl.ship_to_country = row [16]
        
        dl.save
     end
    end
    redirect_to(:controller=>"admin", :action=>"import")
  end
end
