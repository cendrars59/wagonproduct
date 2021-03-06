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

ActiveRecord::Schema.define(version: 20160514071957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.boolean  "active"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "country_id"
    t.integer  "category_id"
    t.boolean  "master"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree
  add_index "categories", ["country_id"], name: "index_categories_on_country_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.boolean  "active"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "description"
    t.integer  "country_id"
    t.boolean  "master",      default: false
  end

  add_index "countries", ["country_id"], name: "index_countries_on_country_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.boolean  "active"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.boolean  "active"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "markets", ["category_id"], name: "index_markets_on_category_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profils", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.boolean  "active"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.string   "description"
    t.string   "boolean"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "country_id"
    t.boolean  "active"
  end

  add_index "retailers", ["country_id"], name: "index_retailers_on_country_id", using: :btree

  create_table "telexes", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.string   "description"
    t.datetime "end_validity"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "categories"
  add_foreign_key "categories", "countries"
  add_foreign_key "countries", "countries"
  add_foreign_key "markets", "categories"
  add_foreign_key "retailers", "countries"
end
