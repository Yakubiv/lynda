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

ActiveRecord::Schema.define(version: 20160407152305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "customer_id"
    t.boolean  "is_new_customer"
    t.integer  "status"
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id", using: :btree

  create_table "appointments_services", id: false, force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "avatar"
    t.string   "bio"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.string   "description"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "images", ["order_id"], name: "index_images_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "customer_id"
    t.integer  "tips"
    t.string   "note"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["appointment_id"], name: "index_orders_on_appointment_id", using: :btree

  create_table "orders_services", id: false, force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer  "total_cash"
    t.integer  "order_id"
    t.string   "total_services"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "receipts", ["order_id"], name: "index_receipts_on_order_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cover"
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "text"
    t.datetime "date"
    t.string   "owner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "favorites_count"
    t.string   "origin_id"
  end

  create_table "twitter_users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "profile_image_url"
    t.integer  "tweets_count"
    t.integer  "followers_count"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "friends_count"
  end

end
