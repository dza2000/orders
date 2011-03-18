class CreateSourceCodeTypes < ActiveRecord::Migration
  def self.up
    create_table :source_code_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :source_code_types
  end
end
