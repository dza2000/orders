class AddNamesToShippingAddresses < ActiveRecord::Migration
  def self.up
    add_column :shipping_addresses, :first_name, :string
    add_column :shipping_addresses, :last_name, :string
  end

  def self.down
    remove_column :shipping_addresses, :first_name
    remove_column :shipping_addresses, :last_name
  end
end
