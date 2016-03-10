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

ActiveRecord::Schema.define(version: 20160310141112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_scores", force: :cascade do |t|
    t.integer  "tierlist_id"
    t.integer  "card_id"
    t.string   "description"
    t.integer  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "hero_code"
    t.integer  "hero_id"
  end

  add_index "card_scores", ["card_id"], name: "index_card_scores_on_card_id", using: :btree
  add_index "card_scores", ["hero_id"], name: "index_card_scores_on_hero_id", using: :btree
  add_index "card_scores", ["tierlist_id"], name: "index_card_scores_on_tierlist_id", using: :btree

  create_table "card_translations", force: :cascade do |t|
    t.integer  "card_id",        null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
    t.string   "image_url"
    t.string   "gold_image_url"
    t.text     "flavor"
    t.text     "text"
  end

  add_index "card_translations", ["card_id"], name: "index_card_translations_on_card_id", using: :btree
  add_index "card_translations", ["locale"], name: "index_card_translations_on_locale", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.string   "card_id"
    t.string   "gold_image_url"
    t.integer  "card_type",      default: 0
    t.integer  "rarity"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "hero_id"
    t.string   "flavor"
    t.string   "text"
  end

  add_index "cards", ["card_type"], name: "index_cards_on_card_type", using: :btree
  add_index "cards", ["hero_id"], name: "index_cards_on_hero_id", using: :btree

  create_table "heros", force: :cascade do |t|
    t.string   "title"
    t.string   "avatar_url"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tierlists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tierlists", ["user_id"], name: "index_tierlists_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
