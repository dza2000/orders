class AddSourceCodeToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :source_code_id, :integer
  end

  def self.down
  remove_column :transactions, :source_code_id
  end
end
