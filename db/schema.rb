# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_14_172931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_ownerships", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_ownerships_on_game_id"
    t.index ["user_id"], name: "index_game_ownerships_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "num_of_players"
    t.integer "duration"
    t.integer "difficulty"
    t.string "boxart"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "meetup_invitations", force: :cascade do |t|
    t.bigint "meetup_id", null: false
    t.bigint "user_id", null: false
    t.integer "invited_by_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meetup_id"], name: "index_meetup_invitations_on_meetup_id"
    t.index ["user_id"], name: "index_meetup_invitations_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "location_name"
    t.integer "game_id"
    t.integer "host_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time"
    t.string "address"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "bio"
    t.string "avatar"
  end

  add_foreign_key "game_ownerships", "games"
  add_foreign_key "game_ownerships", "users"
  add_foreign_key "meetup_invitations", "meetups"
  add_foreign_key "meetup_invitations", "users"
end
