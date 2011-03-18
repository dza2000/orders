class AddStuffToVariousTables < ActiveRecord::Migration
  def self.up
    
    add_column :donations, :recurring, :boolean
    add_column :contacts, :paper_receipt, :boolean
    end

  def self.down
  
  remove_column :donations , :recurring
  remove_column :contacts , :paper_receipt
  end
end
