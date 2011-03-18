class ShippingDetail < ActiveRecord::Base
  belongs_to :transaction
  has_one :state
  has_one :country
end
