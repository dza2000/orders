class CreateInitiatives < ActiveRecord::Migration
  def self.up
    create_table :initiatives do |t|
      t.string :name
      t.text :description
      t.decimal :minimum_donation
      t.integer :catalog_item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :initiatives
  end
end
