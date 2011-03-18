class RecurringGift < ActiveRecord::Base
  belongs_to :contact
  belongs_to :transaction
end
