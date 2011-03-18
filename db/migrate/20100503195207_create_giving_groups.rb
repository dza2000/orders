class CreateGivingGroups < ActiveRecord::Migration
  def self.up
    create_table :giving_groups do |t|
      t.integer :contact_id
      t.string :name
      t.date :start_date

      
    end
  end

  def self.down
    drop_table :giving_groups
  end
end
