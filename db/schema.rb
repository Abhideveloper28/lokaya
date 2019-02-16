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

ActiveRecord::Schema.define(version: 2019_02_16_151359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_details", force: :cascade do |t|
    t.string "subject"
    t.string "language"
    t.string "publisher"
    t.string "edition"
    t.integer "pages"
    t.integer "copies"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_details_on_book_id"
  end

  create_table "book_policies", force: :cascade do |t|
    t.integer "issue_days"
    t.decimal "late_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.bigint "category_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "borrowers", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "student_id"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "issued_by_id"
    t.index ["book_id"], name: "index_borrowers_on_book_id"
    t.index ["issued_by_id"], name: "index_borrowers_on_issued_by_id"
    t.index ["student_id"], name: "index_borrowers_on_student_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "class"
    t.string "section"
    t.string "enrollment_no"
    t.string "contact_no"
    t.string "email_id"
    t.datetime "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_details", "books"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "categories"
  add_foreign_key "borrowers", "books"
  add_foreign_key "borrowers", "students"
  add_foreign_key "borrowers", "users", column: "issued_by_id"
end
