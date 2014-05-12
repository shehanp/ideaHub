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

ActiveRecord::Schema.define(version: 20140511230323) do

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussion_id"
    t.integer  "user_id"
    t.integer  "vote_id"
  end

  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"
  add_index "comments", ["vote_id"], name: "index_comments_on_vote_id"

  create_table "discussions", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "user_id"
    t.integer  "idea_id"
    t.integer  "vote_id"
  end

  add_index "discussions", ["idea_id"], name: "index_discussions_on_idea_id"
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"
  add_index "discussions", ["vote_id"], name: "index_discussions_on_vote_id"

  create_table "favourites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "fork",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_id"
    t.string   "image"
  end

  add_index "ideas", ["vote_id"], name: "index_ideas_on_vote_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "taggings_count", default: 0
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "current_sign_in_ip"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "votes", force: true do |t|
    t.integer  "value"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
