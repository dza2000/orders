class ReceivedIssue < ActiveRecord::Base
  belongs_to :subscription
  has_one :catalog_item
  has_many :shipments
  belongs_to :contact
  belongs_to :published_issue
  
 
end
