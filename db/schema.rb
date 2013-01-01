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

ActiveRecord::Schema.define(:version => 20130101215024) do

  create_table "home_posts", :force => true do |t|
    t.string   "title"
    t.text     "top_body"
    t.text     "bottom_body"
    t.string   "top_title"
    t.string   "bottom_title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "path"
    t.string   "image_object_file_name"
    t.string   "image_object_content_type"
    t.integer  "image_object_file_size"
    t.datetime "image_object_updated_at"
    t.integer  "image_reference_id"
    t.string   "image_reference_type"
  end

  add_index "images", ["image_reference_id", "image_reference_type"], :name => "index_images_on_image_reference_id_and_image_reference_type"

  create_table "ingredients", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "image_reference_id"
    t.string   "image_reference_type"
  end

  add_index "ingredients", ["image_reference_id"], :name => "index_ingredients_on_image_reference_id"

  create_table "ingredients_recipes", :force => true do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
  end

  create_table "menus", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.date     "pickUpDate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_current"
  end

  create_table "menus_recipes", :force => true do |t|
    t.integer "recipe_id"
    t.integer "menu_id"
  end

  create_table "nutrition_infos", :force => true do |t|
    t.float    "calories"
    t.float    "protein"
    t.float    "fat"
    t.float    "carbohydates"
    t.float    "fiber"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "recipe_id"
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
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "image_reference_id"
    t.string   "image_reference_type"
    t.integer  "nutrition_info_id"
    t.string   "size"
    t.float    "price"
    t.string   "category"
  end

  add_index "recipes", ["image_reference_id", "image_reference_type"], :name => "index_recipes_on_image_reference_id_and_image_reference_type"

  create_table "recipes_ingredients", :force => true do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
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
