class CreateCcDetails < ActiveRecord::Migration
  def self.up
    create_table :cc_details do |t|
      t.integer :payment_id
      t.string :cc_mask
      t.date :expiration_date
      t.string :name_on_card
      t.decimal :amount
      t.string :card_type

      t.timestamps
    end
  end

  def self.down
    drop_table :cc_details
  end
end
