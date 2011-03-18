class SubscriptionType < ActiveRecord::Base
  has_many :subscriptions, :foreign_key=>"subscription_name", :primary_key=>"name"
end
