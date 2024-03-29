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

ActiveRecord::Schema.define(version: 20140415152310) do

  create_table "camera_pictures", force: true do |t|
    t.integer  "device_id"
    t.datetime "timestamp"
    t.string   "image"
    t.string   "remote_picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "user_id"
    t.boolean  "public",               default: false,     null: false
    t.string   "uid",                                      null: false
    t.string   "name",                 default: "unnamed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",   default: "",        null: false
    t.string   "authentication_token"
    t.datetime "remember_created_at"
  end

  add_index "devices", ["uid"], name: "index_devices_on_uid", unique: true

  create_table "locations", force: true do |t|
    t.integer  "device_id"
    t.datetime "timestamp"
    t.float    "longitude"
    t.float    "latitude"
    t.float    "altitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_follow_devices", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "device_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_follow_devices", ["device_id"], name: "index_user_follow_devices_on_device_id"
  add_index "user_follow_devices", ["user_id", "device_id"], name: "index_user_follow_devices_on_user_id_and_device_id", unique: true
  add_index "user_follow_devices", ["user_id"], name: "index_user_follow_devices_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "about"
    t.string   "image"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "weathers", force: true do |t|
    t.integer  "device_id"
    t.datetime "timestamp"
    t.float    "temperature"
    t.float    "pressure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
