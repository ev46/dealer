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

ActiveRecord::Schema.define(version: 20140404204315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attached_assets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "cars", force: true do |t|
    t.boolean  "two_door"
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "vin"
    t.integer  "price"
    t.string   "warranty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "miles",      default: 0
    t.integer  "discount",   default: 200
    t.boolean  "sold",       default: false
  end

  create_table "offers", force: true do |t|
    t.string   "email"
    t.integer  "amount"
    t.boolean  "respond",    default: false
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "counter"
    t.boolean  "rejected",   default: false
    t.boolean  "archived",   default: false
  end

  add_index "offers", ["car_id"], name: "index_offers_on_car_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "address"
    t.string   "sun",                  default: "9AM - 6PM"
    t.string   "mon",                  default: "9AM - 6PM"
    t.string   "tus",                  default: "9AM - 6PM"
    t.string   "wed",                  default: "9AM - 6PM"
    t.string   "thr",                  default: "9AM - 6PM"
    t.string   "fri",                  default: "9AM - 6PM"
    t.string   "sat",                  default: "9AM - 6PM"
    t.text     "about"
    t.text     "warranty",             default: "60 days powertrain parts and labor."
    t.string   "time_zone",            default: "Eastern Time (US & Canada)"
    t.integer  "phone",      limit: 8
    t.string   "email"
    t.integer  "fax",        limit: 8
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
