class RemoveLineIdFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :line_id
  end

  def self.down
    add_column :orders, :line_id, :integer
  end
end
