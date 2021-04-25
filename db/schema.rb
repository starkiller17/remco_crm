# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_25_184621) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "bill_to_id"
    t.text "address"
    t.text "street"
    t.string "external_num"
    t.string "internal_num"
    t.text "colony"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.text "reference"
    t.string "industrial_zone"
    t.string "address_type", default: "SHIP_TO"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "ACTIVO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_to_id"], name: "index_addresses_on_bill_to_id"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "bill_tos", force: :cascade do |t|
    t.integer "payment_method_id"
    t.integer "customer_id"
    t.integer "credit_id"
    t.string "rfc"
    t.string "name"
    t.string "email"
    t.string "curp"
    t.string "account_number"
    t.string "currency_code"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "ACTIVO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_id"], name: "index_bill_tos_on_credit_id"
    t.index ["customer_id"], name: "index_bill_tos_on_customer_id"
    t.index ["payment_method_id"], name: "index_bill_tos_on_payment_method_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.string "classification"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "ACTIVO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "credits", force: :cascade do |t|
    t.string "credit"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "ACTIVO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer "category_id"
    t.integer "classification_id"
    t.string "customer"
    t.string "level"
    t.string "customer_type"
    t.string "web_address"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "ACTIVO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_customers_on_category_id"
    t.index ["classification_id"], name: "index_customers_on_classification_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "payment_method"
    t.string "created_by"
    t.string "updated_by"
    t.string "status", default: "ACTIVO"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.boolean "status", default: true
  end

  add_foreign_key "addresses", "bill_tos"
  add_foreign_key "addresses", "customers"
  add_foreign_key "customers", "categories"
  add_foreign_key "customers", "classifications"
end
