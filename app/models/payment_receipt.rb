class PaymentReceipt < ActiveRecord::Base
  belongs_to :payment
end
