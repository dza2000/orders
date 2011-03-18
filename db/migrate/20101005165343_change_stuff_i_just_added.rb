class ChangeStuffIJustAdded < ActiveRecord::Migration
  def self.up
    remove_column :donations, :recurring
    add_column :donations, :recurring, :string
  end

  def self.down
    remove_column :doncations, :recurring
    add_column :donations, :recurring, :boolean
  end
end
