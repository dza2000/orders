class AddPrintFlagToTables < ActiveRecord::Migration
  def self.up
    add_column :transactions, :print, :boolean
    add_column :orders, :print, :boolean
    add_column :donations, :print, :boolean
    add_column :line_items, :print, :boolean
  end

  def self.down
    remove_column :transactions, :print
    remove_column :orders, :print
    remove_column :donations, :print
    remove_column :line_items, :print
  end
end
