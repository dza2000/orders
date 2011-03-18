class ChangeColumnTypeInOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :total, :decimal
  end

  def self.down
  change_column :orders, :total, :integer
  end
end
