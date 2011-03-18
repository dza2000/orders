class ProductsController < ApplicationController
  def index
    @catalog_items = CatalogItem.find(:all, :conditions=>"front_end = true")
  end
  
  def add_to_cart
    item = CatalogItem.find(params[:id])
    @cart = find_cart
    @cart.add_catalog_item(item)
  end
  
  private
  
  def find_cart
    session[:cart] ||= Cart.new
  end

end
