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

ActiveRecord::Schema.define(version: 2021_05_25_045556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pet_id"
    t.integer "status", default: 0
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pet_name"
    t.index ["pet_id"], name: "index_applications_on_pet_id"
    t.index ["user_id", "pet_id"], name: "index_applications_on_user_id_and_pet_id", unique: true
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_favorites_on_pet_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "age"
    t.integer "pet_type"
    t.string "breed"
    t.text "description"
    t.string "gender"
    t.boolean "fixed", default: false
    t.boolean "house_trained", default: false
    t.text "photo_url_1"
    t.text "photo_url_2"
    t.text "photo_url_3"
    t.boolean "good_with_kids", default: false
    t.boolean "good_with_animals", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applications", "pets"
  add_foreign_key "applications", "users"
  add_foreign_key "favorites", "pets"
  add_foreign_key "favorites", "users"
  add_foreign_key "pets", "users"
end
