class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.string :sku
      t.integer :quantity
      t.integer :ship,  :limit => 1
      t.integer :order_id

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
