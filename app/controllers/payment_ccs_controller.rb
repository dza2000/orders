class PaymentCcsController < ApplicationController
  before_filter :authorize
  # GET /payment_ccs
  # GET /payment_ccs.xml
  def index
    @payment_ccs = PaymentCc.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_ccs }
    end
  end

  # GET /payment_ccs/1
  # GET /payment_ccs/1.xml
  def show
    @payment_cc = PaymentCc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_cc }
    end
  end

  # GET /payment_ccs/new
  # GET /payment_ccs/new.xml
  def new
    @payment_cc = PaymentCc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_cc }
    end
  end

  # GET /payment_ccs/1/edit
  def edit
    @payment_cc = PaymentCc.find(params[:id])
  end

  # POST /payment_ccs
  # POST /payment_ccs.xml
  def create
    @payment_cc = PaymentCc.new(params[:payment_cc])

    respond_to do |format|
      if @payment_cc.save
        flash[:notice] = 'PaymentCc was successfully created.'
        format.html { redirect_to(@payment_cc) }
        format.xml  { render :xml => @payment_cc, :status => :created, :location => @payment_cc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_cc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_ccs/1
  # PUT /payment_ccs/1.xml
  def update
    @payment_cc = PaymentCc.find(params[:id])

    respond_to do |format|
      if @payment_cc.update_attributes(params[:payment_cc])
        flash[:notice] = 'PaymentCc was successfully updated.'
        format.html { redirect_to(@payment_cc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_cc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_ccs/1
  # DELETE /payment_ccs/1.xml
  def destroy
    @payment_cc = PaymentCc.find(params[:id])
    @payment_cc.destroy

    respond_to do |format|
      format.html { redirect_to(payment_ccs_url) }
      format.xml  { head :ok }
    end
  end
end
