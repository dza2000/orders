class AddProvinceToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :province, :string
  end

  def self.down
    drop_column :addresses, :province
  end
end
