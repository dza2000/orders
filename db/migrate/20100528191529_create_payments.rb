class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :transaction_id
      t.decimal :amount
      t.string :payment_method
      t.date :payment_date
      t.date :created_at
      t.date :updated_at
      t.string :recurrence

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
