class Donation < ActiveRecord::Base
  
  belongs_to :contact
  has_many :donation_lines
  has_many :shipments
  belongs_to :transaction
  has_many :donation_payments
    
    def formatted_price
    "$"+ sprintf("%.2f", self.donation_amount)
  end
  
  
  DEFAULT_SEARCH_PARAMETERS = {:id_is => 0}

  
  
end
