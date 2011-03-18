class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :altid
      t.string :first_name
      t.string :last_name
      t.string :m_initial
      t.integer :is_individual, :limit => 1
      t.string :suffix
      t.string :title
      t.string :company_name
      t.string :job_title
      t.string :greeting1
      t.string :greeting2
      t.string :greeting3
      t.integer :do_not_mail, :limit => 1
      t.integer :do_not_email,  :limit => 1
      t.integer :do_not_phone,  :limit => 1
      t.string :special_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
