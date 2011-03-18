class CreateProfileAddons < ActiveRecord::Migration
  def self.up
    create_table :profile_addons do |t|
      t.integer :contact_id
      t.integer :age
      t.integer :birth_month
      t.integer :station_id
      t.integer :married, :limit => 1
      t.string :s1_cluster

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_addons
  end
end
