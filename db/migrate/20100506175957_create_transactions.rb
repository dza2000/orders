class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :staff_id
      t.integer :ship, :limit => 1
      t.string  :source_code
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
