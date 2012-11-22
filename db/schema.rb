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

ActiveRecord::Schema.define(:version => 20121122005101) do

  create_table "home_posts", :force => true do |t|
    t.string   "title"
    t.text     "top_body"
    t.text     "bottom_body"
    t.string   "top_title"
    t.string   "bottom_title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "recipes", :force => true do |t|
    t.string   "title"
    t.decimal  "price"
    t.decimal  "calories"
    t.decimal  "protein"
    t.decimal  "fat"
    t.decimal  "carbohydrates"
    t.decimal  "fiber"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name"
    t.string   "street_address"
    t.string   "last_name"
    t.integer  "zip_code"
    t.string   "phone_number"
    t.boolean  "admin",                  :default => false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "confirmation_code"
    t.boolean  "confirmed",              :default => false
  end

end
