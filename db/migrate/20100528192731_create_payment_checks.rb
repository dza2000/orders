class CreatePaymentChecks < ActiveRecord::Migration
  def self.up
    create_table :payment_checks do |t|
      t.integer :payment_id
      t.integer :check_number
      t.date :check_date

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_checks
  end
end
