class Contact < ActiveRecord::Base
  
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :giving_groups
  has_one :profile_addon, :dependent => :destroy
  has_many :segments, :through => :segment_details
  has_many :modifieds
  has_many :notes
  has_many :transactions
  has_many :donations
  has_many :recurring_gifts  
  has_many :orders
  has_many :subscriptions
  has_many :received_issues
  has_many :shipping_addresses
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:line1].blank? && a[:city].blank? && a[:state_id].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:address].blank? && a[:format].blank? && a[:type].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:prefix].blank? && a[:phone_number].blank? && a[:extension].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :profile_addon, :allow_destroy => true

def full_name
  "#{last_name}, #{first_name} #{m_initial}."
end


def issues_remaining
  self.subscriptions.sum(:quantity) - self.received_issues.count
end




def new_subscriber
  last_received_issue = self.received_issues.find(:last)
  last_published_issue = PublishedIssue.find(:last)
  if self.received_issues.size < 1 or last_published_issue.id - 2 >=  last_received_issue.published_issue_id
    return true
  end
end

def ship_subscriber
  last_received_issue = self.received_issues.find(:last)
  last_published_issue = PublishedIssue.find(:last)
  transaction = self.transactions.find(:last)
  if issues_remaining == 0 and transaction.subscriptions.size >= 1 and last_received_issue.published_issue_id == last_published_issue.id - 1
    return true
  end
end



DEFAULT_SEARCH_PARAMETERS = {:id_is => 0}

end


