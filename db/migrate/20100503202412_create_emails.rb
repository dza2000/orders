class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :address
      t.string :format
      t.string :email_type
      t.integer :is_primary,  :limit => 1
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
