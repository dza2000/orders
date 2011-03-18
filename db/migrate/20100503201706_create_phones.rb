class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.integer :prefix
      t.integer :phone_number
      t.integer :extension
      t.string :phone_type
      t.integer :is_primary,  :limit => 1
      t.string :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
