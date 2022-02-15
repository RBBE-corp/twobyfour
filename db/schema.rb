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

ActiveRecord::Schema.define(version: 2022_02_13_122753) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compositions", force: :cascade do |t|
    t.bigint "instrumental_id", null: false
    t.bigint "user_id", null: false
    t.integer "rep_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "memory_list_id"
    t.string "name"
    t.index ["instrumental_id"], name: "index_compositions_on_instrumental_id"
    t.index ["user_id"], name: "index_compositions_on_user_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.string "english_word"
    t.string "japanese_word"
    t.string "category"
    t.datetime "last_practiced"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "instrumentals", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "genre"
    t.float "duration"
    t.integer "bpm"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memory_list_flashcards", force: :cascade do |t|
    t.bigint "flashcard_id", null: false
    t.bigint "memory_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flashcard_id"], name: "index_memory_list_flashcards_on_flashcard_id"
    t.index ["memory_list_id"], name: "index_memory_list_flashcards_on_memory_list_id"
  end

  create_table "memory_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_memory_lists_on_user_id"
  end

  create_table "playlist_compositions", force: :cascade do |t|
    t.bigint "composition_id", null: false
    t.bigint "playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composition_id"], name: "index_playlist_compositions_on_composition_id"
    t.index ["playlist_id"], name: "index_playlist_compositions_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score"
    t.bigint "composition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["composition_id"], name: "index_scores_on_composition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "compositions", "instrumentals"
  add_foreign_key "compositions", "users"
  add_foreign_key "memory_list_flashcards", "flashcards"
  add_foreign_key "memory_list_flashcards", "memory_lists"
  add_foreign_key "memory_lists", "users"
  add_foreign_key "playlist_compositions", "compositions"
  add_foreign_key "playlist_compositions", "playlists"
  add_foreign_key "playlists", "users"
  add_foreign_key "scores", "compositions"
end
