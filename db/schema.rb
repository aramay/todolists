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

ActiveRecord::Schema.define(version: 20160820050413) do

  create_table "profiles", force: :cascade do |t|
    t.string   "gender"
    t.integer  "birth_year"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "todo_items", force: :cascade do |t|
    t.date     "due_date"
    t.string   "title"
    t.text     "description"
    t.boolean  "completed"
    t.integer  "todo_list_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "todo_items", ["todo_list_id"], name: "index_todo_items_on_todo_list_id"

  create_table "todo_lists", force: :cascade do |t|
    t.string   "list_name"
    t.date     "list_due_date"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "todo_lists_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "todo_list_id"
  end

  add_index "todo_lists_users", ["todo_list_id"], name: "index_todo_lists_users_on_todo_list_id"
  add_index "todo_lists_users", ["user_id"], name: "index_todo_lists_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
