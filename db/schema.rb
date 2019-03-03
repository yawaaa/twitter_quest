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

ActiveRecord::Schema.define(version: 20190303091741) do

  create_table "battles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.integer  "winner"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_battles_on_challenge_id", using: :btree
    t.index ["user_id"], name: "index_battles_on_user_id", using: :btree
  end

  create_table "skill_learnings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_skill_learnings_on_skill_id", using: :btree
    t.index ["user_id", "skill_id"], name: "index_skill_learnings_on_user_id_and_skill_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_skill_learnings_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "type_id"
    t.string   "name"
    t.float    "value",                   limit: 24
    t.text     "effect_description",      limit: 65535
    t.text     "requirement_description", limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uid"
    t.string   "twitter_ID"
    t.string   "name"
    t.text     "img_url",              limit: 65535
    t.text     "description",          limit: 65535
    t.integer  "listed_count"
    t.integer  "tweet_count"
    t.integer  "followings_count"
    t.integer  "followers_count"
    t.integer  "favorites_count"
    t.boolean  "is_verified"
    t.datetime "twitter_created_date"
    t.integer  "hp"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "tp"
    t.integer  "gold"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "wins_count"
    t.integer  "losses_count"
    t.integer  "battles_count"
  end

  add_foreign_key "battles", "users"
  add_foreign_key "battles", "users", column: "challenge_id"
  add_foreign_key "skill_learnings", "skills"
  add_foreign_key "skill_learnings", "users"
end
