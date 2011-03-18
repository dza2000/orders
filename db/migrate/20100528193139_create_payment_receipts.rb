class CreatePaymentReceipts < ActiveRecord::Migration
  def self.up
    create_table :payment_receipts do |t|
      t.integer :payment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_receipts
  end
end
