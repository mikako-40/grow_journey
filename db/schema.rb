# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_30_074410) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flower_images", force: :cascade do |t|
    t.string "flower_language"
    t.string "flower_season"
    t.string "flower_name"
    t.string "flower_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "content", null: false
    t.boolean "is_goal", default: false
    t.datetime "deadline", null: false
    t.boolean "status", default: false
    t.boolean "checked", default: false
    t.datetime "achieved_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_goals_on_category_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "user_flower_images", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flower_image_id", null: false
    t.boolean "unlocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flower_image_id"], name: "index_user_flower_images_on_flower_image_id"
    t.index ["user_id"], name: "index_user_flower_images_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "line_user_id", null: false
    t.index ["line_user_id"], name: "index_users_on_line_user_id", unique: true
  end

  add_foreign_key "goals", "categories"
  add_foreign_key "goals", "users"
  add_foreign_key "user_flower_images", "flower_images"
  add_foreign_key "user_flower_images", "users"
end
