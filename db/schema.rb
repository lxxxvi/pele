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

  create_table "tournament_matches", force: :cascade do |t|
    t.string "uefa_match_id", null: false
    t.string "venue_key", null: false
    t.datetime "kickoff_at", null: false
    t.string "tournament_stage", null: false
    t.string "home_team", null: false
    t.string "guest_team", null: false
    t.integer "home_team_score"
    t.integer "guest_team_score"
  end

end
