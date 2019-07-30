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

ActiveRecord::Schema.define(version: 2019_07_29_234847) do

  create_table "game_answers", force: :cascade do |t|
    t.integer "game_id"
    t.integer "game_question_id"
    t.string "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_answers_on_game_id"
    t.index ["game_question_id"], name: "index_game_answers_on_game_question_id"
  end

  create_table "game_forms", force: :cascade do |t|
    t.string "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_questions", force: :cascade do |t|
    t.integer "game_form_id"
    t.integer "question_id"
    t.string "question_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_form_id"], name: "index_game_questions_on_game_form_id"
    t.index ["question_id", "question_type"], name: "index_game_questions_on_question_id_and_question_type"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete?"
  end

  create_table "question_syns", force: :cascade do |t|
    t.string "gif"
    t.string "a"
    t.string "w1"
    t.string "w2"
    t.string "w3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
