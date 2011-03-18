class AddInitiativeIdToDonationLines < ActiveRecord::Migration
  def self.up
    add_column :donation_lines, :initiative_id, :integer
  end

  def self.down
    remove_column :donation_lines, :initiative_id
  end
end
