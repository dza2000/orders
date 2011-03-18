class AddIssuesRemainingToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :issues_remaining, :integer
  end

  def self.down
    remove_column :subscriptions, :issues_remaining
  end
end
