class CreateSourceCodes < ActiveRecord::Migration
  def self.up
    create_table :source_codes do |t|
      t.string :code
      t.string :name
      t.text :description
      t.integer :source_code_type_id
      t.integer :staff_id

      t.timestamps
    end
  end

  def self.down
    drop_table :source_codes
  end
end
