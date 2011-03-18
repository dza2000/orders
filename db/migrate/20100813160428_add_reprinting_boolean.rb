class AddReprintingBoolean < ActiveRecord::Migration
  def self.up
    add_column :donation_lines, :needs_reprinting, :boolean
    add_column :line_items, :needs_reprinting, :boolean
    add_column :subscriptions, :needs_reprinting, :boolean
  end

  def self.down
    remove_column :donation_lines, :needs_reprinting
    remove_column :line_items, :needs_reprinting
    remove_column :subscriptions, :needs_reprinting
  end
end
