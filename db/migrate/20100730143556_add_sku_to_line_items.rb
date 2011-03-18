class AddSkuToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :sku, :string
  end

  def self.down
    remove_column :line_items, :sku
  end
end
