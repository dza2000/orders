class AddShippingInfoToDonationLines < ActiveRecord::Migration
  def self.up
    add_column :donation_lines, :ship_to_first_name, :string
    add_column :donation_lines, :ship_to_last_name, :string
    add_column :donation_lines, :ship_to_address_line1, :string
    add_column :donation_lines, :ship_to_address_line2, :string
    add_column :donation_lines, :ship_to_city, :string
    add_column :donation_lines, :ship_to_state, :string
    add_column :donation_lines, :ship_to_province, :string
    add_column :donation_lines, :ship_to_zip_code, :string
    add_column :donation_lines, :ship_to_country, :string
    remove_column :donation_lines, :initiative_id
    
  end

  def self.down
    remove_column :donation_lines, :ship_to_first_name
    remove_column :donation_lines, :ship_to_last_name
    remove_column :donation_lines, :ship_to_address_line1
    remove_column :donation_lines, :ship_to_address_line2
    remove_column :donation_lines, :ship_to_city
    remove_column :donation_lines, :ship_to_state
    remove_column :donation_lines, :ship_to_province
    remove_column :donation_lines, :ship_to_zip_code
    remove_column :donation_lines, :ship_to_country
    add_column :donation_lines, :initiative_id, :integer
  end
end
