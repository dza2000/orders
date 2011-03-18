class CreateDonationLines < ActiveRecord::Migration
  def self.up
    create_table :donation_lines do |t|
      t.string :name
      t.string :sku
      t.integer :needs_printing,  :limit => 1
      t.integer :quantity
      t.integer :personalized,  :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :donation_lines
  end
end
