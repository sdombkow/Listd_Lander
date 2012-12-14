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

ActiveRecord::Schema.define(:version => 20121214012442) do

  create_table "bars", :force => true do |t|
    t.string   "name"
    t.integer  "phone_number"
    t.string   "address"
    t.text     "intro_paragraph"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "bars", ["user_id"], :name => "index_bars_on_user_id"

  create_table "pass_sets", :force => true do |t|
    t.integer  "bar_id"
    t.date     "date"
    t.integer  "total_released_passes"
    t.integer  "sold_passes"
    t.integer  "unsold_passes"
    t.decimal  "price"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "pass_sets", ["bar_id"], :name => "index_pass_sets_on_bar_id"

  create_table "passes", :force => true do |t|
    t.integer  "pass_set_id"
    t.integer  "purchase_id"
    t.string   "name"
    t.boolean  "redeemed"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "entries",     :default => 0
    t.integer  "price"
  end

  add_index "passes", ["pass_set_id"], :name => "index_passes_on_Pass_Set_id"
  add_index "passes", ["purchase_id"], :name => "index_passes_on_Purchase_id"

  create_table "purchases", :force => true do |t|
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "stripe_card_token"
  end

  add_index "purchases", ["user_id"], :name => "index_purchases_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.boolean  "admin",                  :default => false, :null => false
    t.boolean  "partner",                :default => false, :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "stripe_customer_token"
    t.string   "stripe_card_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
