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

ActiveRecord::Schema.define(version: 2018_01_23_030024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "type"
    t.boolean "contra", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "main_account_id"
    t.index ["code"], name: "index_accounts_on_code", unique: true
    t.index ["main_account_id"], name: "index_accounts_on_main_account_id"
    t.index ["name"], name: "index_accounts_on_name", unique: true
    t.index ["type"], name: "index_accounts_on_type"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.uuid "entry_id"
    t.string "type"
    t.string "commercial_document_type"
    t.uuid "commercial_document_id"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_amounts_on_account_id"
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_amounts"
    t.index ["entry_id"], name: "index_amounts_on_entry_id"
    t.index ["type"], name: "index_amounts_on_type"
  end

  create_table "business_ownerships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "owner_type"
    t.uuid "owner_id"
    t.uuid "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_ownerships_on_business_id"
    t.index ["owner_type", "owner_id"], name: "index_business_ownerships_on_owner_type_and_owner_id"
  end

  create_table "businesses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "type_of_organization_id"
    t.index ["type_of_organization_id"], name: "index_businesses_on_type_of_organization_id"
  end

  create_table "entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference_number"
    t.datetime "entry_date"
    t.string "commercial_document_type"
    t.uuid "commercial_document_id"
    t.string "origin_type"
    t.uuid "origin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_entries"
    t.index ["origin_type", "origin_id"], name: "index_entries_on_origin_type_and_origin_id"
  end

  create_table "taxpayers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "email"
    t.datetime "date_of_birth"
    t.integer "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_taxpayers_on_email", unique: true
    t.index ["sex"], name: "index_taxpayers_on_sex"
  end

  create_table "type_of_organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_type_of_organizations_on_name", unique: true
  end

  create_table "voucher_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "commercial_document_type"
    t.bigint "commercial_document_id"
    t.decimal "amount"
    t.uuid "account_id"
    t.uuid "voucher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_voucher_amounts_on_account_id"
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_voucher_amounts"
    t.index ["voucher_id"], name: "index_voucher_amounts_on_voucher_id"
  end

  create_table "vouchers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "commercial_document_type"
    t.bigint "commercial_document_id"
    t.datetime "date"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_vouchers"
    t.index ["type"], name: "index_vouchers_on_type"
  end

  add_foreign_key "accounts", "accounts", column: "main_account_id"
  add_foreign_key "amounts", "accounts"
  add_foreign_key "amounts", "entries"
  add_foreign_key "business_ownerships", "businesses"
  add_foreign_key "businesses", "type_of_organizations"
  add_foreign_key "voucher_amounts", "accounts"
  add_foreign_key "voucher_amounts", "vouchers"
end
