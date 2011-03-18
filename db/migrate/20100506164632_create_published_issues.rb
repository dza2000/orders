class CreatePublishedIssues < ActiveRecord::Migration
  def self.up
    create_table :published_issues do |t|
      t.string :name
      t.integer :volume
      t.integer :issue
      t.date :pull_date

      t.timestamps
    end
  end

  def self.down
    drop_table :published_issues
  end
end
