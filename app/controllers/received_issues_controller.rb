class ReceivedIssuesController < ApplicationController
  before_filter :authorize
  # GET /received_issues
  # GET /received_issues.xml
  def index
    @received_issues = ReceivedIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @received_issues }
    end
  end

  # GET /received_issues/1
  # GET /received_issues/1.xml
  def show
    @received_issue = ReceivedIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @received_issue }
    end
  end

  # GET /received_issues/new
  # GET /received_issues/new.xml
  def new
    @received_issue = ReceivedIssue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @received_issue }
    end
  end

  # GET /received_issues/1/edit
  def edit
    @received_issue = ReceivedIssue.find(params[:id])
  end

  # POST /received_issues
  # POST /received_issues.xml
  def create
    @received_issue = ReceivedIssue.new(params[:received_issue])

    respond_to do |format|
      if @received_issue.save
        flash[:notice] = 'ReceivedIssue was successfully created.'
        format.html { redirect_to(@received_issue) }
        format.xml  { render :xml => @received_issue, :status => :created, :location => @received_issue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @received_issue.errors, :status => :unprocessable_entity }
      end
      contact = @received_issue.contact
    contact.issues_remaining = contact.issues_remaining 
    contact.update_attributes(params[:contact])
    
    subscription = @received_issue.subscription
    subscription.issues_remaining = subscription.issues_remaining - 1
    subscription.update_attributes(params[:contact])
    end
    
  end

  # PUT /received_issues/1
  # PUT /received_issues/1.xml
  def update
    @received_issue = ReceivedIssue.find(params[:id])

    respond_to do |format|
      if @received_issue.update_attributes(params[:received_issue])
        flash[:notice] = 'ReceivedIssue was successfully updated.'
        format.html { redirect_to(@received_issue) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @received_issue.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # DELETE /received_issues/1
  # DELETE /received_issues/1.xml
  def destroy
    @received_issue = ReceivedIssue.find(params[:id])
    contact = @received_issue.contact
    contact.issues_remaining = contact.issues_remaining - 1
    contact.update_attributes(params[:contact])
    @received_issue.destroy

    respond_to do |format|
      format.html { redirect_to(received_issues_url) }
      format.xml  { head :ok }
    end
    
  end
end
