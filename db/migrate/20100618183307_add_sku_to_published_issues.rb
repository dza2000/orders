class AddSkuToPublishedIssues < ActiveRecord::Migration
  def self.up
    add_column :published_issues, :sku, :string
  end

  def self.down
    remove_column :published_issues, :sku
  end
end
