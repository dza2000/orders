class CreateReceivedIssues < ActiveRecord::Migration
  def self.up
    create_table :received_issues do |t|
      t.integer :subscription_id
      t.integer :issue_published_id
      t.integer :ship,  :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :received_issues
  end
end
