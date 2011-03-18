class Initiative < ActiveRecord::Base
  has_many :donation_lines, :primary_key =>"name", :foreign_key =>"name"
end
