class ChangeShippingAddressInTransactions < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :shipping_address_id, :address_id
  end

  def self.down
    rename_column :transactions, :address_id, :shipping_address_id
  end
end
