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

ActiveRecord::Schema.define(version: 2019_10_19_005404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "city"
    t.string "state"
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "dog_walkings", force: :cascade do |t|
    t.string "state", default: "scheduled"
    t.datetime "date"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "pets"
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_dog_walkings_on_address_id"
    t.index ["date"], name: "index_dog_walkings_on_date"
  end

  add_foreign_key "dog_walkings", "addresses"
end
