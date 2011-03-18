class CreateStaffs < ActiveRecord::Migration
  def self.up
    create_table :staffs do |t|
      t.string :last_name
      t.string :first_name
      t.date :create_date
      t.date :expire_date
      t.string :email
      t.string :password
      t.string :role
      t.string :username

      t.timestamps
    end
  end

  def self.down
    drop_table :staffs
  end
end
