class DonationLine < ActiveRecord::Base
  belongs_to :catalog_item
  belongs_to :donation
    belongs_to :initiative, :primary_key =>"name", :foreign_key =>"name"
    
    def formatted_price
    "$"+ sprintf("%.2f", self.donation_amount)
  end
    
    
end
