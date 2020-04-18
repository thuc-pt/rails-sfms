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

ActiveRecord::Schema.define(version: 2020_03_04_121015) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.date "date"
    t.integer "status", default: 0
    t.bigint "timesheet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_bookings_on_created_at"
    t.index ["status"], name: "index_bookings_on_status"
    t.index ["timesheet_id"], name: "index_bookings_on_timesheet_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.integer "parent_id", default: 0, null: false
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_comments_on_created_at"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "districts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "getting_matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.bigint "match_id"
    t.bigint "user_id"
    t.bigint "team_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.bigint "pitch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_getting_matches_on_district_id"
    t.index ["match_id"], name: "index_getting_matches_on_match_id"
    t.index ["pitch_id"], name: "index_getting_matches_on_pitch_id"
    t.index ["province_id"], name: "index_getting_matches_on_province_id"
    t.index ["team_id"], name: "index_getting_matches_on_team_id"
    t.index ["user_id"], name: "index_getting_matches_on_user_id"
  end

  create_table "levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_levels_on_name", unique: true
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "category", default: 0
    t.string "ward"
    t.string "betting"
    t.datetime "time"
    t.string "competitor"
    t.string "captain_name"
    t.string "phone_number"
    t.text "invition"
    t.integer "status", default: 0
    t.bigint "level_id"
    t.bigint "user_id"
    t.bigint "team_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.bigint "pitch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_matches_on_category"
    t.index ["district_id"], name: "index_matches_on_district_id"
    t.index ["level_id"], name: "index_matches_on_level_id"
    t.index ["pitch_id"], name: "index_matches_on_pitch_id"
    t.index ["province_id"], name: "index_matches_on_province_id"
    t.index ["status"], name: "index_matches_on_status"
    t.index ["team_id"], name: "index_matches_on_team_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "pitches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "image"
    t.time "open_at"
    t.time "close_at"
    t.string "email"
    t.string "link_facebook"
    t.text "description"
    t.boolean "active"
    t.string "address"
    t.bigint "user_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_pitches_on_district_id"
    t.index ["province_id"], name: "index_pitches_on_province_id"
    t.index ["user_id"], name: "index_pitches_on_user_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_posts_on_created_at"
    t.index ["team_id"], name: "index_posts_on_team_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "provinces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_provinces_on_name", unique: true
  end

  create_table "sub_pitch_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sub_pitch_types_on_name", unique: true
  end

  create_table "sub_pitches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "is_new", default: true
    t.text "description"
    t.boolean "active"
    t.bigint "pitch_id"
    t.bigint "sub_pitch_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_sub_pitches_on_pitch_id"
    t.index ["sub_pitch_type_id"], name: "index_sub_pitches_on_sub_pitch_type_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "image"
    t.integer "average_age", default: 20
    t.string "member"
    t.integer "win", default: 0
    t.text "description"
    t.bigint "user_id"
    t.bigint "level_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.bigint "pitch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_teams_on_district_id"
    t.index ["level_id"], name: "index_teams_on_level_id"
    t.index ["name"], name: "index_teams_on_name", unique: true
    t.index ["pitch_id"], name: "index_teams_on_pitch_id"
    t.index ["province_id"], name: "index_teams_on_province_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "timesheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.time "start_at"
    t.time "end_at"
    t.integer "price"
    t.bigint "sub_pitch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_pitch_id"], name: "index_timesheets_on_sub_pitch_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday"
    t.text "address"
    t.string "phone_number"
    t.boolean "gender"
    t.string "image"
    t.integer "role", default: 2
    t.boolean "active", default: true
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bookings", "timesheets"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "districts", "provinces"
  add_foreign_key "getting_matches", "districts"
  add_foreign_key "getting_matches", "matches"
  add_foreign_key "getting_matches", "pitches"
  add_foreign_key "getting_matches", "provinces"
  add_foreign_key "getting_matches", "teams"
  add_foreign_key "getting_matches", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "matches", "districts"
  add_foreign_key "matches", "levels"
  add_foreign_key "matches", "pitches"
  add_foreign_key "matches", "provinces"
  add_foreign_key "matches", "teams"
  add_foreign_key "matches", "users"
  add_foreign_key "pitches", "districts"
  add_foreign_key "pitches", "provinces"
  add_foreign_key "pitches", "users"
  add_foreign_key "posts", "teams"
  add_foreign_key "posts", "users"
  add_foreign_key "sub_pitches", "pitches"
  add_foreign_key "sub_pitches", "sub_pitch_types"
  add_foreign_key "teams", "districts"
  add_foreign_key "teams", "levels"
  add_foreign_key "teams", "pitches"
  add_foreign_key "teams", "provinces"
  add_foreign_key "teams", "users"
  add_foreign_key "timesheets", "sub_pitches"
end
