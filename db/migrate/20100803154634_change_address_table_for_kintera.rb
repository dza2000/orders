class ChangeAddressTableForKintera < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :state_id
    remove_column :addresses, :country_id
    add_column :addresses, :state, :string
    add_column :addresses, :country, :string
  end

  def self.down
    remove_column :addresses, :state
    remove_column :addresses, :country
    add_column :addresses, :state_id, :integer
    add_column :addresses, :country_id, :integer
  end
end
