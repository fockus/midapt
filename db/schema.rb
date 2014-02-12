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

ActiveRecord::Schema.define(version: 20140209164517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "message"
    t.integer  "mind_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["mind_id"], name: "index_comments_on_mind_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "interests", force: true do |t|
    t.float    "gravity"
    t.integer  "user_id",    null: false
    t.integer  "stream_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["stream_id"], name: "index_interests_on_stream_id", using: :btree
  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree

  create_table "marks", force: true do |t|
    t.integer  "mark"
    t.integer  "user_id"
    t.integer  "markable_id"
    t.string   "markable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marks", ["user_id"], name: "index_marks_on_user_id", using: :btree

  create_table "mind_streams", force: true do |t|
    t.integer  "mind_id",    null: false
    t.integer  "stream_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mind_streams", ["mind_id"], name: "index_mind_streams_on_mind_id", using: :btree
  add_index "mind_streams", ["stream_id"], name: "index_mind_streams_on_stream_id", using: :btree

  create_table "minds", force: true do |t|
    t.string   "question"
    t.text     "text"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "minds", ["user_id"], name: "index_minds_on_user_id", using: :btree

  create_table "streams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "comments", "minds", name: "comments_mind_id_fk"
  add_foreign_key "comments", "users", name: "comments_user_id_fk"

  add_foreign_key "interests", "streams", name: "interests_stream_id_fk"
  add_foreign_key "interests", "users", name: "interests_user_id_fk"

  add_foreign_key "mind_streams", "minds", name: "mind_streams_mind_id_fk"
  add_foreign_key "mind_streams", "streams", name: "mind_streams_stream_id_fk"

  add_foreign_key "minds", "users", name: "minds_user_id_fk"

end
