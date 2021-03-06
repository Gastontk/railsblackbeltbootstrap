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

ActiveRecord::Schema.define(version: 20161018173451) do

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["org_id"], name: "index_members_on_org_id"
  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["org_id"], name: "index_memberships_on_org_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "orgs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "owner"
    t.integer  "owner_id"
  end

  add_index "orgs", ["user_id"], name: "index_orgs_on_user_id"

  create_table "orgs_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "org_id"
  end

  add_index "orgs_users", ["org_id"], name: "index_orgs_users_on_org_id"
  add_index "orgs_users", ["user_id"], name: "index_orgs_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
