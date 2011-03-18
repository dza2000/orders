ActionController::Routing::Routes.draw do |map|
  map.connect "admin/import", :controller=>"admin", :action=>"import"
  map.connect "admin/journal_pull", :controller=>"admin", :action=>"journal_pull"
  map.connect "admin/final_report", :controller=>"admin", :action=>"final_report"
  map.resources :admin

  map.resources :products
  
  
  map.resources :initiatives

  map.resources :shipping_addresses

  map.resources :staffs

  map.resources :payment_receipts

  map.resources :transaction_receipts

  map.resources :payments_aches

  map.resources :payment_checks

  map.resources :payment_ccs

  map.resources :payments

  map.resources :source_code_types

  map.resources :source_codes

  map.resources :recurring_gifts

  map.resources :notes

  map.resources :cc_details

  map.resources :check_details

  map.resources :cash_details

  map.resources :shipments

  map.resources :shipment_lines

  map.resources :line_items

  map.resources :received_issues
  
  map.resources :donation_lines
  map.connect "donations/update_total", :controller=>"donations", :action=>"update_total"
  map.resources :donations

  map.resources :categories

  map.resources :orders

  map.resources :shipping_details
  map.connect "transactions/printing", :controller=>"transactions", :action=>"printing"
  map.connect "transactions/prints", :controller=>"transactions", :action=>"prints"
  map.resources :transactions
  
  map.resources :subscription_types
  map.connect "subscriptions/quick_import", :controller=>"subscriptions", :action=>"quick_import"
  map.resources :subscriptions

  map.resources :published_issues

  map.resources :catalog_items

  map.resources :countries

  map.resources :addresses 

  map.resources :emails

  map.resources :phones

  map.resources :giving_groups

  map.resources :segments

  map.resources :segment_details

  map.resources :states

  map.resources :profile_addons

  map.resources :stations
  map.connect "contacts/assign_journals", :controller=>"contacts", :action=>"assign_journals"
map.connect "contacts/import", :controller=>"contacts", :action=>"import"
  map.resources :contacts do |contacts|
  contacts.resources :addresses do |addresses|
    contacts.resources :notes do |notes|
  contacts.resources :transactions do |transactions|
    transactions.resources :orders do |orders|
      orders.resources :line_items do |line_items|
    transactions.resources :donations do |donations|
      donations.resources :donation_lines do |donation_lines|
    transactions.resources :subscriptions do |subscriptions|      
      subscriptions.resources :received_issues
    end
  end
end
end
end
end
end
end
end
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "admin", :action => "login"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
