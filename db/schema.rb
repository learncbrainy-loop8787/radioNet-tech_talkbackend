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

ActiveRecord::Schema.define(version: 4) do

  create_table "unit_warriors", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "warrior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_unit_warriors_on_unit_id"
    t.index ["warrior_id"], name: "index_unit_warriors_on_warrior_id"
  end

  create_table "units", force: :cascade do |t|
    t.boolean "dday"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warriors", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
    t.integer "kills"
    t.string "exp_level"
    t.string "troops"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "unit_warriors", "units"
  add_foreign_key "unit_warriors", "warriors"
end
