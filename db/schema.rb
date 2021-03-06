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

ActiveRecord::Schema.define(version: 20170209032711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "alias",            default: "", null: false
    t.string   "address_1",        default: "", null: false
    t.string   "address_2"
    t.string   "address_3"
    t.string   "province",         default: "", null: false
    t.string   "country",          default: "", null: false
    t.string   "zip",              default: "", null: false
    t.integer  "shipper_id"
    t.integer  "haulier_id"
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "amount",                     null: false
    t.datetime "expiration",                 null: false
    t.boolean  "accepted",   default: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "tax_id",                               null: false
    t.string   "main_contact_first_name", default: "", null: false
    t.string   "main_contact_last_name",  default: "", null: false
    t.integer  "main_contact_phone",                   null: false
    t.string   "main_contact_email",      default: "", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
  end

  create_table "hauliers", force: :cascade do |t|
    t.integer  "drivers_license", null: false
    t.integer  "registration",    null: false
    t.integer  "truck_license",   null: false
    t.integer  "truck_vin",       null: false
    t.integer  "rating"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["company_id"], name: "index_hauliers_on_company_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "pickup_location",                  null: false
    t.string   "dropoff_location",                 null: false
    t.date     "pickup_date",                      null: false
    t.date     "dropoff_date",                     null: false
    t.text     "description",                      null: false
    t.text     "special_notes"
    t.boolean  "delivered",        default: false
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
  end

  create_table "shippers", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_shippers_on_company_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "title",                  default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "nickname",               default: ""
    t.string   "email",                  default: "",    null: false
    t.string   "phone"
    t.integer  "company_id"
    t.string   "company_type",                           null: false
    t.boolean  "is_admin",               default: false
    t.boolean  "terms_accepted"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bids", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "hauliers", "companies"
  add_foreign_key "jobs", "users"
  add_foreign_key "shippers", "companies"
  add_foreign_key "users", "companies"
end
