class Cart
  attr_reader :items
  
  def initialize
    @items = []
  end
  
  def add_catalog_item(catalog_item)
    @items << catalog_item
  end
  
end