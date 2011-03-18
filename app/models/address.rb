class Address < ActiveRecord::Base
  belongs_to :contact
  belongs_to :state, :primary_key => "stateAbbrev", :foreign_key => "abbrev"
  belongs_to :country, :primary_key => "countryAbbrev", :foreign_key => "country_name"
  
  has_many :transactions
  
  ADDRESSTYPE = ['Home', 'Business', 'Shipping', 'All']
end
