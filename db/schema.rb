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

ActiveRecord::Schema.define(version: 20130812005104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quote_requests", force: true do |t|
    t.text     "formstack_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tattoo_removal_requests", force: true do |t|
    t.integer  "quote_request_id"
    t.string   "image1_url"
    t.string   "image2_url"
    t.string   "reason"
    t.string   "location"
    t.string   "size"
    t.string   "inked_by"
    t.string   "ink_age"
    t.string   "colors"
    t.string   "skin_tone"
    t.string   "consultation_visit"
    t.string   "consultation_looking_reason"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "age"
    t.integer  "zip"
    t.string   "referral"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
