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

ActiveRecord::Schema.define(version: 2019_01_16_080026) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "new_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
    t.index ["new_id"], name: "index_comments_on_new_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "leagues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "continent"
    t.integer "number_of_match"
    t.integer "number_of_team"
    t.integer "match_time"
    t.integer "number_of_round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_leagues_on_deleted_at"
  end

  create_table "match_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "team_id1"
    t.integer "team_id2"
    t.integer "score1"
    t.integer "score2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_match_results_on_deleted_at"
    t.index ["match_id"], name: "index_match_results_on_match_id"
    t.index ["team_id1"], name: "index_match_results_on_team_id1", unique: true
    t.index ["team_id2"], name: "index_match_results_on_team_id2", unique: true
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "match_date"
    t.integer "team_id1"
    t.integer "team_id2"
    t.integer "time"
    t.integer "extra_time1"
    t.integer "extra_time2"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_matches_on_deleted_at"
    t.index ["team_id1", "team_id2"], name: "index_matches_on_team_id1_and_team_id2", unique: true
    t.index ["team_id1"], name: "index_matches_on_team_id1"
    t.index ["team_id2"], name: "index_matches_on_team_id2"
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "transfer"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_news_on_deleted_at"
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "score_bet_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_notifications_on_deleted_at"
    t.index ["score_bet_id"], name: "index_notifications_on_score_bet_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "rankings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "team_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "point"
    t.integer "hs"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_rankings_on_deleted_at"
    t.index ["league_id"], name: "index_rankings_on_league_id"
    t.index ["team_id"], name: "index_rankings_on_team_id"
  end

  create_table "rounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_rounds_on_deleted_at"
    t.index ["league_id"], name: "index_rounds_on_league_id"
  end

  create_table "score_bets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "match_id"
    t.float "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "outcome"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_score_bets_on_deleted_at"
    t.index ["match_id"], name: "index_score_bets_on_match_id"
    t.index ["user_id"], name: "index_score_bets_on_user_id"
  end

  create_table "stadia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.string "nation"
    t.string "continent"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_stadia_on_deleted_at"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "league_id"
    t.integer "stadium_id"
    t.date "date_start"
    t.string "short_name"
    t.string "coach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nation"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_teams_on_deleted_at"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.float "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "news", column: "new_id"
  add_foreign_key "comments", "users"
  add_foreign_key "match_results", "matches"
  add_foreign_key "news", "users"
  add_foreign_key "notifications", "score_bets"
  add_foreign_key "notifications", "users"
  add_foreign_key "rankings", "leagues"
  add_foreign_key "rankings", "teams"
  add_foreign_key "rounds", "leagues"
  add_foreign_key "score_bets", "matches"
  add_foreign_key "score_bets", "users"
end
