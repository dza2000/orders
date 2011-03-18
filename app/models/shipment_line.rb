class ShipmentLine < ActiveRecord::Base
  has_and_belongs_to_many :shipment
  has_one :received_issue, :foreign_key=> "transaction_line_ID"
  has_one :donation_line, :foreign_key => "transaction_line_ID"
  has_one :line_item, :foreign_key => "transaction_line_ID"
end
