class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :transaction
  belongs_to :catalog_item, :primary_key=>'sku', :foreign_key=> 'sku'
  has_many :shipments
  before_save :calc_line_total
  after_save :update_order_total
  
  
  
  def formatted_price
    "$"+ sprintf("%.2f", self.price)
  end
  
  def calc_line_total
    self.line_total = quantity*price
  end
  
  def update_order_total
    order = self.order
        lines = self.order.line_items
    subtotal = lines.sum(:line_total)
    order.total = subtotal
    order.update_attribute(:total, order.total)
  
  end
  
  
end
