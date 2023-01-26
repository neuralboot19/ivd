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

ActiveRecord::Schema[7.0].define(version: 2023_01_24_170033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beneficiaries", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "birthday"
    t.string "signature"
    t.string "first_name"
    t.string "last_name"
    t.string "cel_phone"
    t.string "address"
    t.string "status_documents"
    t.string "family_unit"
    t.string "terms_conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contries", force: :cascade do |t|
    t.string "name"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifications", force: :cascade do |t|
    t.string "type_identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "code_municipality"
    t.string "name_municipality"
    t.string "code_ine_municipality"
    t.string "code_nuts_4"
    t.string "name_nuts_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "code"
    t.string "postal_code"
    t.string "name"
    t.string "phone_code"
    t.string "iso_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roads", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "super_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
