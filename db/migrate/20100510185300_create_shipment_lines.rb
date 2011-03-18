class CreateShipmentLines < ActiveRecord::Migration
  def self.up
    create_table :shipment_lines do |t|
      t.integer :shipment_id
      t.integer :transaction_line_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shipment_lines
  end
end
