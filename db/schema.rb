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

ActiveRecord::Schema.define(version: 20140210135524) do

  create_table "admins", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["provider", "uid"], name: "admin_by_uid", unique: true

  create_table "audits", force: true do |t|
    t.integer  "admin_id"
    t.text     "json_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
  end

  add_index "customers", ["slug"], name: "customer_by_slug", unique: true

  create_table "transactions", force: true do |t|
    t.date     "occurred_on"
    t.string   "description"
    t.float    "amount"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
