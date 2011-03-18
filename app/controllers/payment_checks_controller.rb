class PaymentChecksController < ApplicationController
  before_filter :authorize
  # GET /payment_checks
  # GET /payment_checks.xml
  def index
    @payment_checks = PaymentCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_checks }
    end
  end

  # GET /payment_checks/1
  # GET /payment_checks/1.xml
  def show
    @payment_check = PaymentCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_check }
    end
  end

  # GET /payment_checks/new
  # GET /payment_checks/new.xml
  def new
    @payment_check = PaymentCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_check }
    end
  end

  # GET /payment_checks/1/edit
  def edit
    @payment_check = PaymentCheck.find(params[:id])
  end

  # POST /payment_checks
  # POST /payment_checks.xml
  def create
    @payment_check = PaymentCheck.new(params[:payment_check])

    respond_to do |format|
      if @payment_check.save
        flash[:notice] = 'PaymentCheck was successfully created.'
        format.html { redirect_to(@payment_check) }
        format.xml  { render :xml => @payment_check, :status => :created, :location => @payment_check }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_check.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_checks/1
  # PUT /payment_checks/1.xml
  def update
    @payment_check = PaymentCheck.find(params[:id])

    respond_to do |format|
      if @payment_check.update_attributes(params[:payment_check])
        flash[:notice] = 'PaymentCheck was successfully updated.'
        format.html { redirect_to(@payment_check) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_check.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_checks/1
  # DELETE /payment_checks/1.xml
  def destroy
    @payment_check = PaymentCheck.find(params[:id])
    @payment_check.destroy

    respond_to do |format|
      format.html { redirect_to(payment_checks_url) }
      format.xml  { head :ok }
    end
  end
end
