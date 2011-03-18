class PaymentReceiptsController < ApplicationController
  before_filter :authorize
  # GET /payment_receipts
  # GET /payment_receipts.xml
  def index
    @payment_receipts = PaymentReceipt.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_receipts }
    end
  end

  # GET /payment_receipts/1
  # GET /payment_receipts/1.xml
  def show
    @payment_receipt = PaymentReceipt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_receipt }
    end
  end

  # GET /payment_receipts/new
  # GET /payment_receipts/new.xml
  def new
    @payment_receipt = PaymentReceipt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_receipt }
    end
  end

  # GET /payment_receipts/1/edit
  def edit
    @payment_receipt = PaymentReceipt.find(params[:id])
  end

  # POST /payment_receipts
  # POST /payment_receipts.xml
  def create
    @payment_receipt = PaymentReceipt.new(params[:payment_receipt])

    respond_to do |format|
      if @payment_receipt.save
        flash[:notice] = 'PaymentReceipt was successfully created.'
        format.html { redirect_to(@payment_receipt) }
        format.xml  { render :xml => @payment_receipt, :status => :created, :location => @payment_receipt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_receipt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_receipts/1
  # PUT /payment_receipts/1.xml
  def update
    @payment_receipt = PaymentReceipt.find(params[:id])

    respond_to do |format|
      if @payment_receipt.update_attributes(params[:payment_receipt])
        flash[:notice] = 'PaymentReceipt was successfully updated.'
        format.html { redirect_to(@payment_receipt) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_receipt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_receipts/1
  # DELETE /payment_receipts/1.xml
  def destroy
    @payment_receipt = PaymentReceipt.find(params[:id])
    @payment_receipt.destroy

    respond_to do |format|
      format.html { redirect_to(payment_receipts_url) }
      format.xml  { head :ok }
    end
  end
end
