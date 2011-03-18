class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.string :call_letters
      t.decimal  "frequency", :precision => 10, :scale => 1
      t.string :band
      t.string :city
      t.integer :state_id
      t.integer :zip_code
      t.string :program
      t.string :days
      t.time :time
      t.string :network
    end
  end

  def self.down
    drop_table :stations
  end
end
