class CreateSegmentDetails < ActiveRecord::Migration
  def self.up
    create_table :segment_details do |t|
      t.integer :contact_id
      t.integer :segment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :segment_details
  end
end
