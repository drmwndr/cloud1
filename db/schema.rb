# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20170726003353) do

  create_table "conditions", :force => true do |t|
    t.string   "description", :limit => 45
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                                :null => false
    t.integer  "condition_id",                                              :null => false
    t.decimal  "quantity",                    :precision => 8, :scale => 2, :null => false
    t.date     "exp_date"
    t.string   "serial_number", :limit => 45
    t.string   "batch_number",  :limit => 45
    t.string   "stock_address", :limit => 45,                               :null => false
    t.text     "remarks"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "line_items", ["condition_id"], :name => "index_line_items_on_condition_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "order_items", :force => true do |t|
    t.integer  "line_item_id", :null => false
    t.integer  "order_id",     :null => false
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "order_items", ["line_item_id"], :name => "index_order_items_on_line_item_id"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"

  create_table "order_statuses", :force => true do |t|
    t.string   "description", :limit => 45
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "order_status_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "orders", ["order_status_id"], :name => "index_orders_on_order_status_id"

  create_table "product_alternatives", :force => true do |t|
    t.integer  "master_product_id",  :null => false
    t.integer  "similar_product_id", :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "product_alternatives", ["master_product_id"], :name => "index_product_alternatives_on_master_product_id"
  add_index "product_alternatives", ["similar_product_id"], :name => "index_product_alternatives_on_similar_product_id"

  create_table "product_types", :force => true do |t|
    t.string   "description", :limit => 45, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "product_uoms", :force => true do |t|
    t.string   "description", :limit => 45, :null => false
    t.string   "uom",         :limit => 6,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "product_type_id",                                    :null => false
    t.integer  "product_uom_id",                      :default => 1, :null => false
    t.string   "part_number",           :limit => 45
    t.string   "sanitized_part_number", :limit => 45
    t.string   "description",           :limit => 45,                :null => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"
  add_index "products", ["product_uom_id"], :name => "index_products_on_product_uom_id"

end
