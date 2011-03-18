class PaymentsAchesController < ApplicationController
  before_filter :authorize
  # GET /payments_aches
  # GET /payments_aches.xml
  def index
    @payments_aches = PaymentsAch.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments_aches }
    end
  end

  # GET /payments_aches/1
  # GET /payments_aches/1.xml
  def show
    @payments_ach = PaymentsAch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payments_ach }
    end
  end

  # GET /payments_aches/new
  # GET /payments_aches/new.xml
  def new
    @payments_ach = PaymentsAch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payments_ach }
    end
  end

  # GET /payments_aches/1/edit
  def edit
    @payments_ach = PaymentsAch.find(params[:id])
  end

  # POST /payments_aches
  # POST /payments_aches.xml
  def create
    @payments_ach = PaymentsAch.new(params[:payments_ach])

    respond_to do |format|
      if @payments_ach.save
        flash[:notice] = 'PaymentsAch was successfully created.'
        format.html { redirect_to(@payments_ach) }
        format.xml  { render :xml => @payments_ach, :status => :created, :location => @payments_ach }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payments_ach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payments_aches/1
  # PUT /payments_aches/1.xml
  def update
    @payments_ach = PaymentsAch.find(params[:id])

    respond_to do |format|
      if @payments_ach.update_attributes(params[:payments_ach])
        flash[:notice] = 'PaymentsAch was successfully updated.'
        format.html { redirect_to(@payments_ach) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payments_ach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payments_aches/1
  # DELETE /payments_aches/1.xml
  def destroy
    @payments_ach = PaymentsAch.find(params[:id])
    @payments_ach.destroy

    respond_to do |format|
      format.html { redirect_to(payments_aches_url) }
      format.xml  { head :ok }
    end
  end
end
