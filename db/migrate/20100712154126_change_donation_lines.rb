class ChangeDonationLines < ActiveRecord::Migration
  def self.up
    remove_column :donation_lines, :personalized
    add_column :donation_lines, :personalized_to, :string
    add_column :donation_lines, :inscription, :text
  end

  def self.down
    remove_column :donation_lines, :personalized_to
    remove_column :donation_lines, :inscription
    add_column :donation_lines, :personalized, :boolean
  end
end
