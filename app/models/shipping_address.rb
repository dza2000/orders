class ShippingAddress < ActiveRecord::Base
  belongs_to :contact
  belongs_to :state
  belongs_to :country
  has_many :transactions 
end
