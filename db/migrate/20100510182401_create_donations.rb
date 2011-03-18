class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :contact_id
      t.date :date
      t.integer :donation_line_id
      t.decimal :donation_amount
      t.string :dedicated_to
      t.text :personalized_inscription
      t.integer :transaction_id
      t.integer :ship,  :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
