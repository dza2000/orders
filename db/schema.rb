# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101027182820) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "address_type"
    t.integer  "is_primary",    :limit => 1
    t.integer  "contact_id"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "province"
    t.string   "stateAbbrev"
    t.string   "countryAbbrev"
  end

  create_table "cash_details", :force => true do |t|
    t.integer  "amount",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "sku"
    t.integer  "do_not_display_price",        :limit => 1
    t.integer  "taxable",                     :limit => 1
    t.decimal  "FMV",                                      :precision => 10, :scale => 2
    t.integer  "requires_shipping",           :limit => 1
    t.decimal  "shipping_weight",                          :precision => 10, :scale => 2
    t.decimal  "flat_rate_shipping_handling",              :precision => 10, :scale => 2
    t.decimal  "item_level_discounts",                     :precision => 10, :scale => 2
    t.integer  "front_end",                   :limit => 1
    t.integer  "inventory_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "unit_price",                               :precision => 10, :scale => 2
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cc_details", :force => true do |t|
    t.integer  "payment_id"
    t.string   "cc_mask"
    t.date     "expiration_date"
    t.string   "name_on_card"
    t.integer  "amount",          :limit => 10, :precision => 10, :scale => 0
    t.string   "card_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_details", :force => true do |t|
    t.integer  "payment_id"
    t.integer  "check_number"
    t.integer  "amount",       :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "altid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "m_initial"
    t.integer  "is_individual",    :limit => 1
    t.string   "suffix"
    t.string   "title"
    t.string   "company_name"
    t.string   "job_title"
    t.string   "greeting1"
    t.string   "greeting2"
    t.string   "greeting3"
    t.integer  "do_not_mail",      :limit => 1
    t.integer  "do_not_email",     :limit => 1
    t.integer  "do_not_phone",     :limit => 1
    t.string   "special_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "issues_remaining"
    t.boolean  "paper_receipt"
  end

  create_table "countries", :force => true do |t|
    t.string "country_name"
    t.string "country_code"
  end

  create_table "donation_lines", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.integer  "needs_printing",        :limit => 1
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "donation_id"
    t.string   "personalized_to"
    t.text     "inscription"
    t.decimal  "donation_amount",                    :precision => 10, :scale => 2
    t.string   "ship_to_first_name"
    t.string   "ship_to_last_name"
    t.string   "ship_to_address_line1"
    t.string   "ship_to_address_line2"
    t.string   "ship_to_city"
    t.string   "ship_to_state"
    t.string   "ship_to_province"
    t.string   "ship_to_zip_code"
    t.string   "ship_to_country"
    t.boolean  "needs_reprinting"
  end

  create_table "donations", :force => true do |t|
    t.integer  "contact_id"
    t.date     "date"
    t.decimal  "donation_amount",                       :precision => 10, :scale => 2
    t.string   "dedicated_to"
    t.text     "personalized_inscription"
    t.integer  "transaction_id"
    t.integer  "ship",                     :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "print"
    t.string   "recurring"
  end

  create_table "emails", :force => true do |t|
    t.string   "address"
    t.string   "format"
    t.string   "email_type"
    t.integer  "is_primary", :limit => 1
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "giving_groups", :force => true do |t|
    t.integer "contact_id"
    t.string  "name"
    t.date    "start_date"
  end

  create_table "initiatives", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "minimum_donation", :precision => 10, :scale => 2
    t.integer  "catalog_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sku"
    t.decimal  "fmv",              :precision => 10, :scale => 2
    t.boolean  "needs_printing"
    t.integer  "quantity"
    t.string   "product_name"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "quantity"
    t.integer  "ship",             :limit => 1
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "catalog_item_id"
    t.decimal  "price",                         :precision => 10, :scale => 2
    t.boolean  "print"
    t.decimal  "line_total",                    :precision => 10, :scale => 2
    t.string   "sku"
    t.boolean  "needs_reprinting"
  end

  create_table "notes", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "staff_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "transaction_id"
    t.decimal  "static_shipping_fee",   :precision => 10, :scale => 2
    t.decimal  "static_tax",            :precision => 10, :scale => 2
    t.decimal  "total",                 :precision => 10, :scale => 2
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "print"
    t.string   "shipping_method"
    t.string   "ship_to_name"
    t.string   "ship_to_address_line1"
    t.string   "ship_to_address_line2"
    t.string   "ship_to_city"
    t.string   "ship_to_stateAbbrev"
    t.string   "ship_to_zip"
    t.string   "ship_to_province"
    t.string   "ship_to_country"
  end

  create_table "payment_ccs", :force => true do |t|
    t.integer  "payment_id"
    t.string   "cc_mask"
    t.string   "cc_type"
    t.date     "cc_exp_date"
    t.string   "cardholder_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_checks", :force => true do |t|
    t.integer  "payment_id"
    t.integer  "check_number"
    t.date     "check_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_receipts", :force => true do |t|
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer "transaction_id"
    t.integer "amount",         :limit => 10, :precision => 10, :scale => 0
    t.string  "payment_method"
    t.date    "payment_date"
    t.date    "created_at"
    t.date    "updated_at"
    t.string  "recurrence"
  end

  create_table "payments_aches", :force => true do |t|
    t.integer  "payment_id"
    t.string   "account_mask"
    t.string   "routing_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.integer  "prefix"
    t.integer  "phone_number"
    t.integer  "extension"
    t.string   "phone_type"
    t.integer  "is_primary",   :limit => 1
    t.string   "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prev_sub_list", :id => false, :force => true do |t|
    t.integer "sub_id",          :default => 0, :null => false
    t.integer "first_issue"
    t.integer "prev_sub_id"
    t.integer "prev_last_issue"
  end

  create_table "profile_addons", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "age"
    t.integer  "birth_month"
    t.integer  "station_id"
    t.integer  "married",     :limit => 1
    t.string   "s1_cluster"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "published_issues", :force => true do |t|
    t.string   "name"
    t.integer  "volume"
    t.integer  "issue"
    t.date     "pull_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sku"
  end

  create_table "received_issues", :force => true do |t|
    t.integer  "subscription_id"
    t.integer  "published_issue_id"
    t.integer  "ship",               :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
  end

  create_table "recurring_gifts", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "contact_id"
    t.date     "start_date"
    t.integer  "amount",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "deactivate"
    t.integer  "interval"
    t.string   "interval_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segment_details", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "segment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shipment_lines", :force => true do |t|
    t.integer  "shipment_id"
    t.integer  "transaction_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipments", :force => true do |t|
    t.integer  "staff_id"
    t.string   "tracking_number"
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "province"
    t.integer  "zip"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact_id"
  end

  create_table "shipping_details", :force => true do |t|
    t.integer  "transaction_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "province"
    t.integer  "country_id"
    t.string   "shipping_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "source_code_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "source_codes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "source_code_type_id"
    t.integer  "staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.date     "create_date"
    t.date     "expire_date"
    t.string   "email"
    t.string   "password"
    t.string   "role"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string "name"
    t.string "abbrev"
  end

  create_table "stations", :force => true do |t|
    t.string  "call_letters"
    t.decimal "frequency",    :precision => 10, :scale => 1
    t.string  "band"
    t.string  "city"
    t.integer "state_id"
    t.integer "zip_code"
    t.string  "program"
    t.string  "days"
    t.time    "time"
    t.string  "network"
  end

  create_table "subscription_types", :force => true do |t|
    t.string   "name"
    t.integer  "number_of_issues"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "unit_cost",        :precision => 10, :scale => 2
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "subscription_type_id"
    t.integer  "deactivated",          :limit => 1
    t.integer  "quantity"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "unit_cost",                         :precision => 10, :scale => 2
    t.string   "subscription_name"
    t.boolean  "needs_reprinting"
    t.text     "reship_details"
    t.integer  "issues_remaining"
    t.string   "new_renewal"
  end

  add_index "subscriptions", ["contact_id"], :name => "contact_id"

  create_table "transaction_receipts", :force => true do |t|
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "staff_id"
    t.integer  "ship",           :limit => 1
    t.string   "source_code"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_code_id"
    t.integer  "address_id"
    t.boolean  "print"
  end

end
