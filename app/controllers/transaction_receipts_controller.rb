class TransactionReceiptsController < ApplicationController
  before_filter :authorize
  # GET /transaction_receipts
  # GET /transaction_receipts.xml
  def index
    @transaction_receipts = TransactionReceipt.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transaction_receipts }
    end
  end

  # GET /transaction_receipts/1
  # GET /transaction_receipts/1.xml
  def show
    @transaction_receipt = TransactionReceipt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction_receipt }
    end
  end

  # GET /transaction_receipts/new
  # GET /transaction_receipts/new.xml
  def new
    @transaction_receipt = TransactionReceipt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction_receipt }
    end
  end

  # GET /transaction_receipts/1/edit
  def edit
    @transaction_receipt = TransactionReceipt.find(params[:id])
  end

  # POST /transaction_receipts
  # POST /transaction_receipts.xml
  def create
    @transaction_receipt = TransactionReceipt.new(params[:transaction_receipt])

    respond_to do |format|
      if @transaction_receipt.save
        flash[:notice] = 'TransactionReceipt was successfully created.'
        format.html { redirect_to(@transaction_receipt) }
        format.xml  { render :xml => @transaction_receipt, :status => :created, :location => @transaction_receipt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction_receipt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transaction_receipts/1
  # PUT /transaction_receipts/1.xml
  def update
    @transaction_receipt = TransactionReceipt.find(params[:id])

    respond_to do |format|
      if @transaction_receipt.update_attributes(params[:transaction_receipt])
        flash[:notice] = 'TransactionReceipt was successfully updated.'
        format.html { redirect_to(@transaction_receipt) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction_receipt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_receipts/1
  # DELETE /transaction_receipts/1.xml
  def destroy
    @transaction_receipt = TransactionReceipt.find(params[:id])
    @transaction_receipt.destroy

    respond_to do |format|
      format.html { redirect_to(transaction_receipts_url) }
      format.xml  { head :ok }
    end
  end
end
