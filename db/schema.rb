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

ActiveRecord::Schema[7.1].define(version: 2024_07_20_121445) do
  create_table "book_printing_histories", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "printing_number"
    t.date "printed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_printing_histories_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "author"
    t.datetime "published_at"
    t.integer "pages"
    t.string "genre"
    t.boolean "available"
    t.decimal "price", precision: 8, scale: 2
    t.integer "language"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "front_image_id"
    t.string "front_image_filename"
    t.string "front_image_size"
    t.string "front_image_content_type"
  end

  add_foreign_key "book_printing_histories", "books"
end
