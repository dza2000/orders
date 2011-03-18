class AddLineTotalToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :line_total, :decimal
  end

  def self.down
    remove_column :line_items, :line_total
  end
end
