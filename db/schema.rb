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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150121055036) do

  create_table "addresses", force: true do |t|
    t.string   "contacts"
    t.string   "mobile_phone"
    t.string   "province"
    t.string   "city"
    t.string   "county"
    t.string   "detail"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_divisions", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_ids"
  end

  create_table "content_classifies", force: true do |t|
    t.string   "name"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "nav_id"
    t.integer  "stick"
    t.integer  "stick_num"
    t.integer  "status"
    t.string   "pics"
    t.string   "dispics"
    t.string   "cattas"
    t.integer  "manager_id"
    t.string   "content_classify_id"
    t.string   "content_seo"
    t.string   "author"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dict_types", force: true do |t|
    t.string   "name"
    t.text     "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dicts", force: true do |t|
    t.string   "name"
    t.integer  "dict_type_id"
    t.text     "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "managers", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "loginNum"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

  create_table "navs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "open_way"
    t.integer  "sort_num"
    t.integer  "status"
    t.integer  "parent_id"
    t.string   "parent_ids"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_codes", force: true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "appoint_date"
    t.string   "appoint_time"
    t.integer  "status"
    t.string   "total"
    t.string   "p_deduct"
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_code"
  end

  create_table "product_classifies", force: true do |t|
    t.string   "name"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_orders", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.string   "product_num"
    t.string   "service_area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.string   "feeScale"
    t.text     "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.string   "charge_type"
    t.integer  "product_classify_id"
    t.string   "unit"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "mobile_phone"
    t.string   "password_digest"
    t.string   "portrait"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "birthday"
    t.integer  "sex"
  end

end
