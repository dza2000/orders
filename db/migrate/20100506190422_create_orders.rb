class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :transaction_id
      t.integer :line_id
      t.decimal :static_shipping_fee
      t.decimal :static_tax
      t.decimal :total
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
