class AddIndexToSubscriptions < ActiveRecord::Migration
  def self.up
    add_index :subscriptions, :contact_id, :name=>"contact_id"
  end

  def self.down
    remove_index :subscriptions, :contact_id
  end
end
