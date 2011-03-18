class AddCatalogItemIdToLineItems < ActiveRecord::Migration
  def self.up
    remove_column :line_items, :sku
    add_column :line_items, :catalog_item_id, :integer
    add_column :line_items, :price, :decimal
  end

  def self.down
    remove_column :line_items, :catalog_item_id
    remove_column :line_items, :price
    add_column :line_items, :sku, :string
  end
end
