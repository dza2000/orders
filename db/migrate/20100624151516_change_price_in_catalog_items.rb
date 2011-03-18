class ChangePriceInCatalogItems < ActiveRecord::Migration
  def self.up
    remove_column :catalog_items, :unit_price
    add_column :catalog_items, :unit_price, :decimal
  end

  def self.down
    remove_column :catalog_items, :unit_price
    add_column :catalog_items, :unit_price, :integer
    
  end
end
