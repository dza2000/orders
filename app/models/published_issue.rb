class PublishedIssue < ActiveRecord::Base
  has_many :received_issues
end
