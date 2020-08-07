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

ActiveRecord::Schema.define(version: 2020_08_05_072825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.string "uefa_match_id", null: false
    t.bigint "venue_id", null: false
    t.datetime "kickoff_at", null: false
    t.string "tournament_stage", null: false
    t.bigint "home_team_id"
    t.bigint "guest_team_id"
    t.integer "home_team_score"
    t.integer "guest_team_score"
    t.index ["guest_team_id"], name: "index_matches_on_guest_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "trigram", null: false
    t.string "flag_svg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trigram"], name: "index_teams_on_trigram", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.string "city", null: false
    t.string "country_time_zone_identifier", null: false
    t.index ["name", "city"], name: "index_venues_on_name_and_city", unique: true
  end

  add_foreign_key "matches", "teams", column: "guest_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "matches", "venues"
end
