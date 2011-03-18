class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :transaction_id
      t.integer :subscription_type_id
      t.decimal :unit_cost_static
      t.integer :deactivated, :limit => 1
      t.integer :quantity
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
