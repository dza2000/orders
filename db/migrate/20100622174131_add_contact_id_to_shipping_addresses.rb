class AddContactIdToShippingAddresses < ActiveRecord::Migration
  def self.up
    add_column :shipping_addresses, :contact_id, :integer
  end

  def self.down
    remove_column :shipping_addresses, :contact_id
  end
end
