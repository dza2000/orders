class ChangeDonationAmountToDecimal < ActiveRecord::Migration
  def self.up
    change_column :donations, :donation_amount, :decimal
  end

  def self.down
    change_column :donations, :donation_amount, :integer
  end
end
