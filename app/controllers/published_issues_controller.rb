class PublishedIssuesController < ApplicationController
  before_filter :authorize
  # GET /published_issues
  # GET /published_issues.xml
  def index
    @published_issues = PublishedIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @published_issues }
    end
  end

  # GET /published_issues/1
  # GET /published_issues/1.xml
  def show
    @published_issue = PublishedIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @published_issue }
    end
  end

  # GET /published_issues/new
  # GET /published_issues/new.xml
  def new
    @published_issue = PublishedIssue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @published_issue }
    end
  end

  # GET /published_issues/1/edit
  def edit
    @published_issue = PublishedIssue.find(params[:id])
  end

  # POST /published_issues
  # POST /published_issues.xml
  def create
    @published_issue = PublishedIssue.new(params[:published_issue])

    respond_to do |format|
      if @published_issue.save
        flash[:notice] = 'PublishedIssue was successfully created.'
        format.html { redirect_to(@published_issue) }
        format.xml  { render :xml => @published_issue, :status => :created, :location => @published_issue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @published_issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /published_issues/1
  # PUT /published_issues/1.xml
  def update
    @published_issue = PublishedIssue.find(params[:id])

    respond_to do |format|
      if @published_issue.update_attributes(params[:published_issue])
        flash[:notice] = 'PublishedIssue was successfully updated.'
        format.html { redirect_to(@published_issue) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @published_issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /published_issues/1
  # DELETE /published_issues/1.xml
  def destroy
    @published_issue = PublishedIssue.find(params[:id])
    @published_issue.destroy

    respond_to do |format|
      format.html { redirect_to(published_issues_url) }
      format.xml  { head :ok }
    end
  end
end
