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

ActiveRecord::Schema.define(version: 20140516221546) do

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussion_id"
    t.integer  "user_id"
    t.integer  "idea_id"
  end

  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id"
  add_index "comments", ["idea_id"], name: "index_comments_on_idea_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "discussions", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "user_id"
    t.integer  "idea_id"
  end

  add_index "discussions", ["idea_id"], name: "index_discussions_on_idea_id"
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"

  create_table "favourites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forked_ideas", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "fork_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "idea_id"
  end

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "fork",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
    t.integer  "forked_from_idea_id"
    t.integer  "user_id"
  end

  add_index "ideas", ["cached_votes_down"], name: "index_ideas_on_cached_votes_down"
  add_index "ideas", ["cached_votes_score"], name: "index_ideas_on_cached_votes_score"
  add_index "ideas", ["cached_votes_total"], name: "index_ideas_on_cached_votes_total"
  add_index "ideas", ["cached_votes_up"], name: "index_ideas_on_cached_votes_up"
  add_index "ideas", ["cached_weighted_score"], name: "index_ideas_on_cached_weighted_score"
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id"

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["idea_id"], name: "index_memberships_on_idea_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "linkedin"
    t.string   "twitter"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

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
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
