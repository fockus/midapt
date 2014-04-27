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

ActiveRecord::Schema.define(version: 20140312235058) do

  create_table "comments", force: true do |t|
    t.text     "message",    null: false
    t.integer  "mind_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["mind_id"], name: "index_comments_on_mind_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "interests", force: true do |t|
    t.float    "gravity"
    t.integer  "user_id",    null: false
    t.integer  "stream_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["stream_id"], name: "index_interests_on_stream_id"
  add_index "interests", ["user_id"], name: "index_interests_on_user_id"

  create_table "marks", force: true do |t|
    t.integer  "mark"
    t.integer  "user_id",       null: false
    t.integer  "markable_id"
    t.string   "markable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marks", ["user_id"], name: "index_marks_on_user_id"

  create_table "mind_streams", force: true do |t|
    t.integer  "mind_id",    null: false
    t.integer  "stream_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mind_streams", ["mind_id"], name: "index_mind_streams_on_mind_id"
  add_index "mind_streams", ["stream_id"], name: "index_mind_streams_on_stream_id"

  create_table "minds", force: true do |t|
    t.string   "title"
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "minds", ["user_id"], name: "index_minds_on_user_id"

  create_table "streams", force: true do |t|
    t.string   "name",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count", default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts", default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
