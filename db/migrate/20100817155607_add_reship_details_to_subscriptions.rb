class AddReshipDetailsToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :reship_details, :text
  end

  def self.down
    remove_column :subscriptions, :reship_details
  end
end
