class Order < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :contact
  has_many :line_items
  
  
  
  
  
  def formatted_price
    "$"+ sprintf("%.2f", self.total)
  end
end
