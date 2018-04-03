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

ActiveRecord::Schema.define(version: 20180403122945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_colors", force: :cascade do |t|
    t.bigint "color_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_colors_on_article_id"
    t.index ["color_id"], name: "index_article_colors_on_color_id"
  end

  create_table "articles", force: :cascade do |t|
    t.text "description"
    t.integer "price"
    t.text "chosen_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "position", default: 0
  end

  create_table "colors", force: :cascade do |t|
    t.integer "r"
    t.integer "g"
    t.integer "b"
    t.float "h"
    t.float "s"
    t.float "l"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_special", default: false
  end

  create_table "principal_colors", force: :cascade do |t|
    t.integer "r"
    t.integer "g"
    t.integer "b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoot_shows", force: :cascade do |t|
    t.bigint "shoot_id"
    t.bigint "shooting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shooting_position", default: 0
    t.index ["shoot_id"], name: "index_shoot_shows_on_shoot_id"
    t.index ["shooting_id"], name: "index_shoot_shows_on_shooting_id"
  end

  create_table "shootings", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoots", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "position", default: 0
  end

  create_table "shows", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_position", default: 0
    t.index ["article_id"], name: "index_shows_on_article_id"
    t.index ["list_id"], name: "index_shows_on_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_colors", "articles"
  add_foreign_key "article_colors", "colors"
  add_foreign_key "shoot_shows", "shootings"
  add_foreign_key "shoot_shows", "shoots"
  add_foreign_key "shows", "articles"
  add_foreign_key "shows", "lists"
end
