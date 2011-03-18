class Shipment < ActiveRecord::Base
  has_one :staff
  has_one :transaction
  has_many :shipment_lines
end
