class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.string :address_type
      t.integer :is_primary,  :limit => 1
      t.integer :contact_id
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
