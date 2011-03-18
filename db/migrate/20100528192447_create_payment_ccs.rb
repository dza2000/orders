class CreatePaymentCcs < ActiveRecord::Migration
  def self.up
    create_table :payment_ccs do |t|
      t.integer :payment_id
      t.string :cc_mask
      t.string :cc_type
      t.date :cc_exp_date
      t.string :cardholder_name

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_ccs
  end
end
