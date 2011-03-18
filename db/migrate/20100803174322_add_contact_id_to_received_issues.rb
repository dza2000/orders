class AddContactIdToReceivedIssues < ActiveRecord::Migration
  def self.up
    add_column :received_issues, :contact_id, :integer
  end

  def self.down
  remove_column :received_issues, :contact_id
  end
end
