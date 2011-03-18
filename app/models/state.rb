class State < ActiveRecord::Base
  has_many :stations
  has_many :addresses
  has_many :shipping_addresses
  
 end
