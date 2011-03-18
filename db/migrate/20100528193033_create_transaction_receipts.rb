class CreateTransactionReceipts < ActiveRecord::Migration
  def self.up
    create_table :transaction_receipts do |t|
      t.integer :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_receipts
  end
end
