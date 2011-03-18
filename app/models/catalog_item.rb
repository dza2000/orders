class CatalogItem < ActiveRecord::Base
  belongs_to :category
  has_many :line_items, :primary_key => "sku", :foreign_key => "sku"
  has_many :donation_lines
    
   def full_name
  "#{sku} #{name} "
end
    
    has_attached_file :image
end
