class CreateSubscriptionTypes < ActiveRecord::Migration
  def self.up
    create_table :subscription_types do |t|
      t.string :name
      t.integer :number_of_issues
      t.decimal :unit_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_types
  end
end
