class AddFieldsToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :ship_to_name, :string
    add_column :orders, :ship_to_address_line1, :string
    add_column :orders, :ship_to_address_line2, :string
    add_column :orders, :ship_to_city, :string
    add_column :orders, :ship_to_stateAbbrev, :string
    add_column :orders, :ship_to_zip, :string
    add_column :orders, :ship_to_province, :string
    add_column :orders, :ship_to_country, :string
  end

  def self.down
    remove_column :orders, :ship_to_name
    remove_column :orders, :ship_to_removeress_line1 
    remove_column :orders, :ship_to_removeress_line2 
    remove_column :orders, :ship_to_city 
    remove_column :orders, :ship_to_stateAbbrev 
    remove_column :orders, :ship_to_zip 
    remove_column :orders, :ship_to_province 
    remove_column :orders, :ship_to_country 
  end
end
