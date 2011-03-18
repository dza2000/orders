class ChangeSubscriptionTypeCostToDecimal < ActiveRecord::Migration
  def self.up
    remove_column :subscription_types, :unit_cost
    add_column :subscription_types, :unit_cost, :decimal
  end

  def self.down
    remove_column :subscription_types, :unit_cost
    add_column :subscription_types, :unit_cost, :integer
    
  end
end
