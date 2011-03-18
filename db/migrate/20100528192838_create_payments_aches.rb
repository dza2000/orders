class CreatePaymentsAches < ActiveRecord::Migration
  def self.up
    create_table :payments_aches do |t|
      t.integer :payment_id
      t.string :account_mask
      t.string :routing_mask

      t.timestamps
    end
  end

  def self.down
    drop_table :payments_aches
  end
end
