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

ActiveRecord::Schema[8.0].define(version: 2025_02_11_124059) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "entries", force: :cascade do |t|
    t.uuid "lottery_id", null: false
    t.bigint "prize_id"
    t.string "email", null: false
    t.string "name"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lottery_id"], name: "index_entries_on_lottery_id"
    t.index ["prize_id"], name: "index_entries_on_prize_id"
  end

  create_table "lotteries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "name_field_enabled", default: false, null: false
    t.boolean "note_field_enabled", default: false, null: false
    t.date "deadline", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.index ["user_id"], name: "index_lotteries_on_user_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.uuid "lottery_id", null: false
    t.string "name", null: false
    t.integer "winners_count", null: false
    t.string "winning_email_subject", null: false
    t.string "winning_email_body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lottery_id"], name: "index_prizes_on_lottery_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entries", "lotteries"
  add_foreign_key "entries", "prizes"
  add_foreign_key "lotteries", "users"
  add_foreign_key "prizes", "lotteries"
end
