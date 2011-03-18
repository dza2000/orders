class Transaction < ActiveRecord::Base
  has_many :donations
  has_many :orders
  has_many :line_items
  has_many :subscriptions
  has_many :subscription_types
  has_many :modifieds
  has_one :shipping_detail
  has_many :shipments
  has_one :staff
  has_one :payment
  belongs_to :contact
  has_many :recurring_gifts
  belongs_to :source_code
  belongs_to :address
  
  accepts_nested_attributes_for :donations, :allow_destroy => true
  accepts_nested_attributes_for :orders, :allow_destroy => true
  accepts_nested_attributes_for :subscriptions, :allow_destroy => true
  accepts_nested_attributes_for :recurring_gifts, :allow_destroy => true
  
  def practice
    self.donations.sum(:donation_amount)+self.orders.sum(:total)+self.subscriptions.sum(:unit_cost)
        
  end
  
  def formatted_date
    self.created_at.strftime("%m/%d/%Y")
  end
  
  def formatted_price
    "$" + sprintf("%.2f", self.practice)
  end
  
  def gen_source_code
    "GC"+self.created_at.strftime("%y%m%d")+"GIFT"
  end
  
  DEFAULT_SEARCH_PARAMETERS = {:id_is => 0}
  
end
