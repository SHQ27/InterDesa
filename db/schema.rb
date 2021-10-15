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

ActiveRecord::Schema.define(version: 2021_10_15_160622) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "document_number"
    t.datetime "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_plans", force: :cascade do |t|
    t.integer "number_of_payments", null: false
    t.integer "unit_id", null: false
    t.integer "client_id", null: false
    t.datetime "start", null: false
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "frequency_id", default: 0
    t.integer "percentage", default: 0
    t.float "down_payment", default: 0.0
    t.index ["client_id"], name: "index_payment_plans_on_client_id"
    t.index ["unit_id"], name: "index_payment_plans_on_unit_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "start", null: false
    t.datetime "due", null: false
    t.float "amount"
    t.boolean "paid"
    t.integer "payment_plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.datetime "paid_at"
    t.datetime "due_notified_at"
    t.datetime "upcoming_notified_at"
    t.index ["payment_plan_id"], name: "index_payments_on_payment_plan_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.integer "type_id", null: false
    t.float "price", default: 0.0
    t.text "details"
    t.integer "building_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rooms"
    t.index ["building_id"], name: "index_units_on_building_id"
  end

  add_foreign_key "payment_plans", "clients"
  add_foreign_key "payment_plans", "units"
  add_foreign_key "payments", "payment_plans"
  add_foreign_key "units", "buildings"
end
