class CreateCatalogItems < ActiveRecord::Migration
  def self.up
    create_table :catalog_items do |t|
      t.string :name
      t.string :description
      t.string :SKU
      t.decimal :unit_price
      t.integer :do_not_display_price,  :limit => 1
      t.integer :taxable, :limit => 1
      t.decimal :FMV
      t.integer :requires_shipping, :limit => 1
      t.decimal :shipping_weight
      t.decimal :flat_rate_shipping_handling
      t.decimal :item_level_discounts
      t.integer :front_end, :limit => 1
      t.integer :inventory_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :catalog_items
  end
end
