class Payment < ActiveRecord::Base
  belongs_to :transaction
  has_many :payment_checks
  has_many :payment_ccs
  has_many :payment_ach
end
