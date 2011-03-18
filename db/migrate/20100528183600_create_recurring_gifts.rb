class CreateRecurringGifts < ActiveRecord::Migration
  def self.up
    create_table :recurring_gifts do |t|
      t.integer :transaction_id
      t.integer :contact_id
      t.date :start_date
      t.decimal :amount
      t.integer :deactivate
      t.integer :interval
      t.string :interval_size

      t.timestamps
    end
  end

  def self.down
    drop_table :recurring_gifts
  end
end
