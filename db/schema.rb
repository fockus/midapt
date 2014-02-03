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

ActiveRecord::Schema.define(version: 20140201153631) do

  create_table "comments", force: true do |t|
    t.text     "message"
    t.integer  "mind_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["mind_id"], name: "index_comments_on_mind_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "mind_tags", force: true do |t|
    t.integer  "mind_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mind_tags", ["mind_id"], name: "index_mind_tags_on_mind_id"
  add_index "mind_tags", ["tag_id"], name: "index_mind_tags_on_tag_id"

  create_table "minds", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "minds", ["user_id"], name: "index_minds_on_user_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_comment_marks", force: true do |t|
    t.integer  "mark"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_comment_marks", ["comment_id"], name: "index_user_comment_marks_on_comment_id"
  add_index "user_comment_marks", ["user_id"], name: "index_user_comment_marks_on_user_id"

  create_table "user_mind_marks", force: true do |t|
    t.integer  "mark"
    t.integer  "user_id"
    t.integer  "mind_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_mind_marks", ["mind_id"], name: "index_user_mind_marks_on_mind_id"
  add_index "user_mind_marks", ["user_id"], name: "index_user_mind_marks_on_user_id"

  create_table "user_mind_tag_marks", force: true do |t|
    t.integer  "mark"
    t.integer  "user_id"
    t.integer  "mind_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_mind_tag_marks", ["mind_tag_id"], name: "index_user_mind_tag_marks_on_mind_tag_id"
  add_index "user_mind_tag_marks", ["user_id"], name: "index_user_mind_tag_marks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
