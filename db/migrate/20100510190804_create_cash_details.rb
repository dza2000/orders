class CreateCashDetails < ActiveRecord::Migration
  def self.up
    create_table :cash_details do |t|
      t.decimal :amount
      t.integer :payment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cash_details
  end
end
