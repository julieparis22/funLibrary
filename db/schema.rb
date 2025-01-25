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

ActiveRecord::Schema[8.0].define(version: 2025_01_25_123730) do
  create_table "books", id: :string, force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.boolean "is_borrowed", default: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lector_id", null: false
    t.index ["lector_id"], name: "index_books_on_lector_id"
  end

  create_table "books_readers", id: false, force: :cascade do |t|
    t.integer "reader_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id", "reader_id"], name: "index_books_readers_on_book_id_and_reader_id"
    t.index ["reader_id", "book_id"], name: "index_books_readers_on_reader_id_and_book_id"
  end

  create_table "lectors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.date "birthDate"
    t.string "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firstName", "lastName", "birthDate"], name: "index_readers_on_firstname_lastname_birthdate", unique: true
  end

  create_table "users", primary_key: ["firstName", "lastName", "birthDate"], force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.date "birthDate"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firstName", "lastName", "birthDate"], name: "index_users_on_firstName_and_lastName_and_birthDate", unique: true
  end

  add_foreign_key "books", "lectors"
end
