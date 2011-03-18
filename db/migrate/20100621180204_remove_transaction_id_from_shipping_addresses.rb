class RemoveTransactionIdFromShippingAddresses < ActiveRecord::Migration
  def self.up
    remove_column :shipping_addresses, :transaction_id
  end

  def self.down
    add_column :shipping_addresses, :transaction_id, :integer
  end
end
