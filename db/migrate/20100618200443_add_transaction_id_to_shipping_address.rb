class AddTransactionIdToShippingAddress < ActiveRecord::Migration
  def self.up
    add_column :shipping_addresses, :transaction_id, :integer
  end

  def self.down
    remove_column :shipping_address, :transaction_id
  end
end
