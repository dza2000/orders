class AddSubTypeToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :subscription_type, :string
  end

  def self.down
    remove_column :subscriptions, :subscription_type
  end
end
