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

ActiveRecord::Schema.define(version: 20150930011400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "number_of_holes", default: 18
    t.boolean  "par3",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "holes", force: :cascade do |t|
    t.integer  "hole_number"
    t.integer  "par_mens"
    t.integer  "par_ladies"
    t.integer  "yardage"
    t.integer  "handicap_mens"
    t.integer  "handicap_ladies"
    t.integer  "tee_box_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "holes", ["tee_box_id"], name: "index_holes_on_tee_box_id", using: :btree

  create_table "match_holes", force: :cascade do |t|
    t.integer  "team_1_natural_score",     default: 0
    t.integer  "team_1_handicap_modifier", default: 0
    t.integer  "team_2_natural_score",     default: 0
    t.integer  "team_2_handicap_modifier", default: 0
    t.boolean  "played",                   default: false
    t.integer  "hole_id"
    t.integer  "match_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "match_holes", ["hole_id"], name: "index_match_holes_on_hole_id", using: :btree
  add_index "match_holes", ["match_id"], name: "index_match_holes_on_match_id", using: :btree

  create_table "match_player_holes", force: :cascade do |t|
    t.integer  "natural_score",     default: 0
    t.integer  "handicap_modifier", default: 0
    t.boolean  "played",            default: false
    t.integer  "match_player_id"
    t.integer  "hole_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "match_player_holes", ["hole_id"], name: "index_match_player_holes_on_hole_id", using: :btree
  add_index "match_player_holes", ["match_player_id"], name: "index_match_player_holes_on_match_player_id", using: :btree

  create_table "match_players", force: :cascade do |t|
    t.decimal  "handicap",       default: 0.0
    t.integer  "match_id"
    t.integer  "team_player_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "match_players", ["match_id"], name: "index_match_players_on_match_id", using: :btree
  add_index "match_players", ["team_player_id"], name: "index_match_players_on_team_player_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["round_id"], name: "index_matches_on_round_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.decimal  "handicap",   default: 0.0
    t.string   "email"
    t.text     "notes"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "round_types", force: :cascade do |t|
    t.string   "round_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.date     "round_date"
    t.integer  "round_type_id"
    t.integer  "tournament_id"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree
  add_index "rounds", ["round_type_id"], name: "index_rounds_on_round_type_id", using: :btree
  add_index "rounds", ["tournament_id"], name: "index_rounds_on_tournament_id", using: :btree

  create_table "team_players", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "tournament_player_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "team_players", ["team_id"], name: "index_team_players_on_team_id", using: :btree
  add_index "team_players", ["tournament_player_id"], name: "index_team_players_on_tournament_player_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_number"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "teams", ["tournament_id"], name: "index_teams_on_tournament_id", using: :btree

  create_table "tee_box_types", force: :cascade do |t|
    t.string   "tee_box_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tee_boxes", force: :cascade do |t|
    t.string   "color"
    t.decimal  "mens_course_rating"
    t.integer  "mens_course_slope"
    t.decimal  "ladies_course_rating"
    t.integer  "ladies_course_slope"
    t.integer  "total_yardage_dirty"
    t.integer  "tee_box_type_id"
    t.integer  "course_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tee_boxes", ["course_id"], name: "index_tee_boxes_on_course_id", using: :btree
  add_index "tee_boxes", ["tee_box_type_id"], name: "index_tee_boxes_on_tee_box_type_id", using: :btree

  create_table "tournament_player_holes", force: :cascade do |t|
    t.integer  "natural_score",              default: 0
    t.integer  "handicap_modifier",          default: 0
    t.boolean  "played",                     default: false
    t.integer  "tournament_player_round_id"
    t.integer  "hole_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "tournament_player_holes", ["hole_id"], name: "index_tournament_player_holes_on_hole_id", using: :btree
  add_index "tournament_player_holes", ["tournament_player_round_id"], name: "index_tournament_player_holes_on_tournament_player_round_id", using: :btree

  create_table "tournament_player_rounds", force: :cascade do |t|
    t.integer  "total_natural_score"
    t.integer  "round_handicap_modifier"
    t.integer  "round_id"
    t.integer  "tournament_player_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tournament_player_rounds", ["round_id"], name: "index_tournament_player_rounds_on_round_id", using: :btree
  add_index "tournament_player_rounds", ["tournament_player_id"], name: "index_tournament_player_rounds_on_tournament_player_id", using: :btree

  create_table "tournament_players", force: :cascade do |t|
    t.decimal  "tournament_handicap", default: 0.0
    t.integer  "player_id"
    t.integer  "tournament_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "tournament_players", ["player_id"], name: "index_tournament_players_on_player_id", using: :btree
  add_index "tournament_players", ["tournament_id"], name: "index_tournament_players_on_tournament_id", using: :btree

  create_table "tournament_types", force: :cascade do |t|
    t.string   "tournament_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.date     "tournament_date"
    t.string   "title"
    t.string   "subtitle"
    t.string   "location"
    t.boolean  "handicap",           default: false
    t.boolean  "male_players",       default: true
    t.boolean  "female_players",     default: false
    t.boolean  "started",            default: false
    t.boolean  "complete",           default: false
    t.integer  "tournament_type_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "tournaments", ["tournament_type_id"], name: "index_tournaments_on_tournament_type_id", using: :btree

  add_foreign_key "holes", "tee_boxes"
  add_foreign_key "match_holes", "holes"
  add_foreign_key "match_holes", "matches"
  add_foreign_key "match_player_holes", "holes"
  add_foreign_key "match_player_holes", "match_players"
  add_foreign_key "match_players", "matches"
  add_foreign_key "match_players", "team_players"
  add_foreign_key "matches", "rounds"
  add_foreign_key "rounds", "courses"
  add_foreign_key "rounds", "round_types"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "team_players", "teams"
  add_foreign_key "team_players", "tournament_players"
  add_foreign_key "teams", "tournaments"
  add_foreign_key "tee_boxes", "courses"
  add_foreign_key "tee_boxes", "tee_box_types"
  add_foreign_key "tournament_player_holes", "holes"
  add_foreign_key "tournament_player_holes", "tournament_player_rounds"
  add_foreign_key "tournament_player_rounds", "rounds"
  add_foreign_key "tournament_player_rounds", "tournament_players"
  add_foreign_key "tournament_players", "players"
  add_foreign_key "tournament_players", "tournaments"
  add_foreign_key "tournaments", "tournament_types"
end
