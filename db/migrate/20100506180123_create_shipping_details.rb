class CreateShippingDetails < ActiveRecord::Migration
  def self.up
    create_table :shipping_details do |t|
      t.integer :transaction_id
      t.string :first_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.integer :state_id
      t.string :province
      t.integer :country_id
      t.string :shipping_method

      t.timestamps
    end
  end

  def self.down
    drop_table :shipping_details
  end
end
