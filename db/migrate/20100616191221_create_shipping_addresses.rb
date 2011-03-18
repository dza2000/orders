class CreateShippingAddresses < ActiveRecord::Migration
  def self.up
    create_table :shipping_addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.integer :state_id
      t.string :province
      t.integer :zip
      t.integer :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shipping_addresses
  end
end
