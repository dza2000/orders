class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :country_name
      t.string :country_code
    end
  end

  def self.down
    drop_table :countries
  end
end
