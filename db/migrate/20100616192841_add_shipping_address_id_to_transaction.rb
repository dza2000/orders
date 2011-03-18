class AddShippingAddressIdToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :shipping_address_id, :integer
  end

  def self.down
    remove_column :transactions, :shipping_address_id
  end
end
