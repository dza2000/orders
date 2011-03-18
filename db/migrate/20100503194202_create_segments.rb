class CreateSegments < ActiveRecord::Migration
  def self.up
    create_table :segments do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :segments
  end
end
