class AddDonationAmountToDonationLines < ActiveRecord::Migration
  def self.up
    add_column :donation_lines, :donation_amount, :decimal
  end

  def self.down
    remove_column :donation_lines, :donation_amount
  end
end
