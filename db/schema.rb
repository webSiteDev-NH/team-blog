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

ActiveRecord::Schema.define(version: 2020_02_18_022259) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "facility_name", null: false
    t.string "address"
    t.string "phone_number"
    t.time "start_time"
    t.time "close_time"
    t.text "access"
    t.integer "courts"
    t.string "image"
    t.string "url"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "holiday_start_time"
    t.time "holiday_close_time"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_facilities_on_email", unique: true
    t.index ["reset_password_token"], name: "index_facilities_on_reset_password_token", unique: true
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number"
    t.string "position"
    t.string "name", null: false
    t.date "birthday"
    t.integer "height"
    t.integer "weight"
    t.integer "goals", default: 0
    t.string "play_style"
    t.string "image"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "opponent", null: false
    t.string "result", default: "", null: false
    t.integer "goal"
    t.integer "allow"
    t.text "scorer"
    t.text "commentary"
    t.date "game_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.bigint "category_id"
    t.string "video"
    t.boolean "goals_check"
    t.bigint "facility_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["facility_id"], name: "index_posts_on_facility_id"
    t.index ["team_id"], name: "index_posts_on_team_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "team_name", default: "", null: false
    t.string "representative", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teams_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teams_on_reset_password_token", unique: true
  end

  add_foreign_key "players", "teams"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "facilities"
  add_foreign_key "posts", "teams"
end
