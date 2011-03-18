class ShipmentLinesController < ApplicationController
  before_filter :authorize
  # GET /shipment_lines
  # GET /shipment_lines.xml
  def index
    @shipment_lines = ShipmentLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipment_lines }
    end
  end

  # GET /shipment_lines/1
  # GET /shipment_lines/1.xml
  def show
    @shipment_line = ShipmentLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipment_line }
    end
  end

  # GET /shipment_lines/new
  # GET /shipment_lines/new.xml
  def new
    @shipment_line = ShipmentLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipment_line }
    end
  end

  # GET /shipment_lines/1/edit
  def edit
    @shipment_line = ShipmentLine.find(params[:id])
  end

  # POST /shipment_lines
  # POST /shipment_lines.xml
  def create
    @shipment_line = ShipmentLine.new(params[:shipment_line])

    respond_to do |format|
      if @shipment_line.save
        flash[:notice] = 'ShipmentLine was successfully created.'
        format.html { redirect_to(@shipment_line) }
        format.xml  { render :xml => @shipment_line, :status => :created, :location => @shipment_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipment_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipment_lines/1
  # PUT /shipment_lines/1.xml
  def update
    @shipment_line = ShipmentLine.find(params[:id])

    respond_to do |format|
      if @shipment_line.update_attributes(params[:shipment_line])
        flash[:notice] = 'ShipmentLine was successfully updated.'
        format.html { redirect_to(@shipment_line) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipment_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipment_lines/1
  # DELETE /shipment_lines/1.xml
  def destroy
    @shipment_line = ShipmentLine.find(params[:id])
    @shipment_line.destroy

    respond_to do |format|
      format.html { redirect_to(shipment_lines_url) }
      format.xml  { head :ok }
    end
  end
end
