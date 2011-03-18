class ChangeDonationTables < ActiveRecord::Migration
  def self.up
    remove_column :donations, :donation_line_id
    add_column :donation_lines, :donation_id, :integer  
  end

  def self.down
    remove_column :donation_lines, :donation_id
      add_column :donations, :donation_line_id, :integer
  end
end
