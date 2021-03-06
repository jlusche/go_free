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

ActiveRecord::Schema.define(version: 20141228051017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue"
    t.string   "category"
    t.string   "special"
  end

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.integer  "phone"
    t.boolean  "free_parking"
    t.text     "parking_notes"
    t.text     "tours"
    t.text     "direction_notes"
    t.text     "special_closure"
    t.text     "event_notes"
    t.string   "avatar"
    t.string   "img_url"
    t.string   "full_img"
  end

  create_table "museums", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "neighborhood"
    t.text     "tours"
    t.text     "description"
    t.integer  "parking"
    t.text     "parking_notes"
    t.text     "direction_notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
