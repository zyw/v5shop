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

ActiveRecord::Schema.define(version: 20141215093653) do

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
  end

end
