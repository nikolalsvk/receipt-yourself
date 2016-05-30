# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160530172350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_partner_accounts", force: :cascade do |t|
    t.integer  "number"
    t.boolean  "activated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_partners", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_accounts", force: :cascade do |t|
    t.integer  "number"
    t.string   "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_cards", force: :cascade do |t|
    t.string   "pib",        null: false
    t.string   "country",    null: false
    t.string   "region"
    t.string   "city",       null: false
    t.string   "address",    null: false
    t.string   "email",      null: false
    t.string   "website",    null: false
    t.string   "phone",      null: false
    t.string   "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_bank_statements", force: :cascade do |t|
    t.integer  "number"
    t.datetime "statement_date"
    t.decimal  "previous_amount"
    t.decimal  "new_amout"
    t.decimal  "reserved_amount"
    t.decimal  "total_payment"
    t.decimal  "total_payout"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "daily_statements", force: :cascade do |t|
    t.integer  "debtor_account_number"
    t.string   "debtor_account_name"
    t.string   "debtor_account_city"
    t.integer  "debtor_model_number"
    t.string   "debtor_reference_number"
    t.string   "debtor_payment_purpose"
    t.integer  "creditor_model_number"
    t.string   "creditor_reference_number"
    t.integer  "creditor_account_number"
    t.string   "approval_reference_number"
    t.integer  "payment_number"
    t.string   "payment_currency"
    t.decimal  "transfer_amount"
    t.string   "account_city"
    t.datetime "currency_date"
    t.datetime "payment_date"
    t.integer  "calculation_method"
    t.integer  "priority"
    t.integer  "status"
    t.decimal  "remaining_amount"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "financial_years", force: :cascade do |t|
    t.integer  "year"
    t.boolean  "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "input_invoice_closures", force: :cascade do |t|
    t.datetime "closure_date"
    t.decimal  "closure_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "input_invoices", force: :cascade do |t|
    t.integer  "number"
    t.decimal  "payment_amount"
    t.decimal  "remaining_amount"
    t.datetime "issuance_date"
    t.datetime "circulation_date"
    t.datetime "payment_deadline"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "output_invoice_closures", force: :cascade do |t|
    t.datetime "closure_date"
    t.decimal  "closure_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "output_invoices", force: :cascade do |t|
    t.integer  "number"
    t.decimal  "amount"
    t.decimal  "remaining_amout"
    t.datetime "issuance_date"
    t.datetime "circulation_date"
    t.datetime "payment_deadline"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "payment_formings", force: :cascade do |t|
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_orders", force: :cascade do |t|
    t.integer  "creditor_account_number"
    t.string   "account_name"
    t.string   "account_city"
    t.integer  "payment_method"
    t.integer  "debtor_model_number"
    t.string   "debtor_reference_number"
    t.string   "debtor_payment_purpose"
    t.string   "approval_reference_number"
    t.integer  "payment_number"
    t.string   "payment_currency"
    t.decimal  "transfer_amount"
    t.datetime "currency_date"
    t.datetime "payment_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "payment_proposals", force: :cascade do |t|
    t.datetime "payment_date"
    t.integer  "number"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
