class CreateShipments < ActiveRecord::Migration
  def self.up
    create_table :shipments do |t|
      t.integer :staff_id
      t.string :tracking_number
      t.integer :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shipments
  end
end
