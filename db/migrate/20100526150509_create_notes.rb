class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :subject
      t.text :body
      t.integer :staff_id
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
