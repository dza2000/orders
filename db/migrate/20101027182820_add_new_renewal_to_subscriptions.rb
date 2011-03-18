class AddNewRenewalToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :new_renewal, :string
  end

  def self.down
    remove_column :subscriptions, :new_renewal
  end
end
