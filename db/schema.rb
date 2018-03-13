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

ActiveRecord::Schema.define(version: 2018_03_12_131713) do

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

  create_table "business_activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.uuid "business_trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_activities_on_business_id"
    t.index ["business_trade_id"], name: "index_business_activities_on_business_trade_id"
  end

  create_table "business_areas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.decimal "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_areas_on_business_id"
  end

  create_table "business_fees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "fee_id"
    t.uuid "business_id"
    t.datetime "date"
    t.decimal "cost", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_fees_on_business_id"
    t.index ["fee_id"], name: "index_business_fees_on_fee_id"
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

  create_table "business_requirements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.uuid "requirement_id"
    t.index ["business_id"], name: "index_business_requirements_on_business_id"
    t.index ["requirement_id"], name: "index_business_requirements_on_requirement_id"
  end

  create_table "business_tax_brackets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "minimum_gross_sale"
    t.decimal "maximum_gross_sale"
    t.decimal "tax_amount"
    t.integer "tax_rate"
    t.integer "tax_type"
    t.decimal "tax_rate_for_excess"
    t.decimal "gross_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tax_type"], name: "index_business_tax_brackets_on_tax_type"
  end

  create_table "business_taxes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.datetime "date"
    t.decimal "cost", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "tax_id"
    t.index ["business_id"], name: "index_business_taxes_on_business_id"
    t.index ["tax_id"], name: "index_business_taxes_on_tax_id"
  end

  create_table "business_trades", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "sub_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_category_id"], name: "index_business_trades_on_sub_category_id"
  end

  create_table "businesses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "type_of_organization_id"
    t.uuid "business_tax_account_id"
    t.index ["business_tax_account_id"], name: "index_businesses_on_business_tax_account_id"
    t.index ["type_of_organization_id"], name: "index_businesses_on_type_of_organization_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
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

  create_table "fees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.decimal "amount", default: "0.0"
    t.uuid "revenue_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "feeable_type"
    t.uuid "feeable_id"
    t.integer "payment_recurrence", default: 0
    t.integer "fee_type"
    t.index ["fee_type"], name: "index_fees_on_fee_type"
    t.index ["feeable_type", "feeable_id"], name: "index_fees_on_feeable_type_and_feeable_id"
    t.index ["name"], name: "index_fees_on_name", unique: true
    t.index ["payment_recurrence"], name: "index_fees_on_payment_recurrence"
    t.index ["revenue_account_id"], name: "index_fees_on_revenue_account_id"
  end

  create_table "gross_sales", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.decimal "amount", default: "0.0"
    t.decimal "tax_amount", default: "0.0"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "business_tax_bracket_id"
    t.index ["business_id"], name: "index_gross_sales_on_business_id"
    t.index ["business_tax_bracket_id"], name: "index_gross_sales_on_business_tax_bracket_id"
  end

  create_table "official_receipts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "number"
    t.datetime "date"
    t.string "receiptable_type"
    t.uuid "receiptable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiptable_type", "receiptable_id"], name: "index_official_receipts_on_receiptable_type_and_receiptable_id"
  end

  create_table "requirement_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.datetime "date"
    t.string "client_type"
    t.uuid "client_id"
    t.uuid "business_requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_requirement_id"], name: "index_requirement_transactions_on_business_requirement_id"
    t.index ["client_type", "client_id"], name: "index_requirement_transactions_on_client_type_and_client_id"
    t.index ["type"], name: "index_requirement_transactions_on_type"
  end

  create_table "requirements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.uuid "main_requirement_id"
    t.index ["main_requirement_id"], name: "index_requirements_on_main_requirement_id"
    t.index ["type"], name: "index_requirements_on_type"
  end

  create_table "sub_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
    t.index ["name"], name: "index_sub_categories_on_name", unique: true
  end

  create_table "taxes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.uuid "revenue_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["revenue_account_id"], name: "index_taxes_on_revenue_account_id"
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
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.uuid "invited_by_id"
    t.integer "invitations_count", default: 0
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_taxpayers_on_email", unique: true
    t.index ["invitation_token"], name: "index_taxpayers_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_taxpayers_on_invitations_count"
    t.index ["invited_by_id"], name: "index_taxpayers_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_taxpayers_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_taxpayers_on_reset_password_token", unique: true
    t.index ["sex"], name: "index_taxpayers_on_sex"
    t.index ["unlock_token"], name: "index_taxpayers_on_unlock_token", unique: true
  end

  create_table "tenants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_type_of_organizations_on_name", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "middle_name"
    t.integer "role"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
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
  add_foreign_key "business_activities", "business_trades"
  add_foreign_key "business_activities", "businesses"
  add_foreign_key "business_areas", "businesses"
  add_foreign_key "business_fees", "businesses"
  add_foreign_key "business_fees", "fees"
  add_foreign_key "business_ownerships", "businesses"
  add_foreign_key "business_requirements", "businesses"
  add_foreign_key "business_requirements", "requirements"
  add_foreign_key "business_taxes", "businesses"
  add_foreign_key "business_taxes", "taxes"
  add_foreign_key "business_trades", "sub_categories"
  add_foreign_key "businesses", "accounts", column: "business_tax_account_id"
  add_foreign_key "businesses", "type_of_organizations"
  add_foreign_key "fees", "accounts", column: "revenue_account_id"
  add_foreign_key "gross_sales", "business_tax_brackets"
  add_foreign_key "gross_sales", "businesses"
  add_foreign_key "requirement_transactions", "business_requirements"
  add_foreign_key "requirements", "requirements", column: "main_requirement_id"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "taxes", "accounts", column: "revenue_account_id"
  add_foreign_key "voucher_amounts", "accounts"
  add_foreign_key "voucher_amounts", "vouchers"
end
