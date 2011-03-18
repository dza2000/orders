class Subscription < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :subscription_type, :foreign_key => "name", :primary_key => "subscription_name"
  has_many :received_issues
  belongs_to :contact
  before_save :deactivate
  
  
  def initial_subscription
    contact = self.contact
    last_received_issue = self.received_issues.find(:last)
    last_published_issue = PublishedIssue.find(:last)
    if contact.received_issues.size < 1 or last_published_issue.id > last_received_issue.published_issue_id - 1
      
      return true
    end
  end
  
  def deactivate
    if self.deactivated == true
      self.quantity == self.received_issues.count
      self.issues_remaining == 0
      self.update_attributes(params[:subscription])
    end
  end
  
  
  def fulfilled
    self.received_issues >= self.quantity
    return true
  end
  
end
