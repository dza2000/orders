class ChangeUnitCostInSubscriptions < ActiveRecord::Migration
  def self.up
    remove_column :subscriptions, :unit_cost_static
    add_column :subscriptions, :unit_cost, :decimal
  end

  def self.down
    remove_column :subscriptions, :unit_cost
    add_column :subscriptions, :unit_cost_static, :integer
  end
end
