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

ActiveRecord::Schema.define(version: 20160825085113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abode_comments", force: :cascade do |t|
    t.integer  "squatters_id"
    t.integer  "abodes_id"
    t.string   "summary"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["abodes_id"], name: "index_abode_comments_on_abodes_id", using: :btree
    t.index ["squatters_id"], name: "index_abode_comments_on_squatters_id", using: :btree
  end

  create_table "abode_images", force: :cascade do |t|
    t.integer  "abode_id"
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abode_id"], name: "index_abode_images_on_abode_id", using: :btree
  end

  create_table "abode_reviews", force: :cascade do |t|
    t.integer  "squatter_id"
    t.integer  "abode_id"
    t.string   "summary"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["abode_id"], name: "index_abode_reviews_on_abode_id", using: :btree
    t.index ["squatter_id"], name: "index_abode_reviews_on_squatter_id", using: :btree
  end

  create_table "abodes", force: :cascade do |t|
    t.string   "title"
    t.boolean  "residential",                               default: false
    t.text     "location"
    t.text     "description"
    t.decimal  "latitude",        precision: 20, scale: 14
    t.decimal  "longitude",       precision: 20, scale: 14
    t.boolean  "approved",                                  default: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "submitted_by_id"
    t.integer  "approved_by_id"
    t.datetime "approved_at"
    t.integer  "sleeps_number"
    t.index ["approved_by_id"], name: "index_abodes_on_approved_by_id", using: :btree
    t.index ["submitted_by_id"], name: "index_abodes_on_submitted_by_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "squatter_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["squatter_id"], name: "index_identities_on_squatter_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "replied_to_id"
    t.boolean  "read",          default: false
    t.boolean  "visible",       default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "squatter_reviews", force: :cascade do |t|
    t.integer  "reviewee_id"
    t.integer  "reviewer_id"
    t.string   "summary"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "squatters", force: :cascade do |t|
    t.string   "email",                                            default: "", null: false
    t.string   "username"
    t.string   "encrypted_password",                               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "type"
    t.text     "location"
    t.decimal  "latitude",               precision: 20, scale: 14
    t.decimal  "longitude",              precision: 20, scale: 14
    t.index ["confirmation_token"], name: "index_squatters_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_squatters_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_squatters_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "identities", "squatters"
end
