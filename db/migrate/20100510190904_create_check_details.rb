class CreateCheckDetails < ActiveRecord::Migration
  def self.up
    create_table :check_details do |t|
      t.integer :payment_id
      t.integer :check_number
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :check_details
  end
end
