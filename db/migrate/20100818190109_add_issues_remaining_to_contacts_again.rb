class AddIssuesRemainingToContactsAgain < ActiveRecord::Migration
  def self.up
    add_column :contacts, :issues_remaining, :integer
  end

  def self.down
    remove_column :contacts, :issues_remaining
  end
end
