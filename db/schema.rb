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

ActiveRecord::Schema.define(version: 20140927192017) do

  create_table "accounts", force: true do |t|
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "company"
    t.string   "primarySkill"
    t.string   "secondarySkill"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "bids", force: true do |t|
    t.integer  "bid"
    t.string   "bidinfo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "user_id"
  end

  add_index "bids", ["post_id"], name: "index_bids_on_post_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "credits", force: true do |t|
    t.integer  "debit"
    t.integer  "credit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "credits", ["user_id"], name: "index_credits_on_user_id"

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "post_id"
  end

  add_index "jobs", ["post_id"], name: "index_jobs_on_post_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.string   "category"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
