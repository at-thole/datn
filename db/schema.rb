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

ActiveRecord::Schema.define(version: 20170324111546) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "travel_place_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["travel_place_id"], name: "index_comments_on_travel_place_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "num_rate",        limit: 24
    t.integer  "user_id"
    t.integer  "travel_place_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["travel_place_id"], name: "index_rates_on_travel_place_id", using: :btree
    t.index ["user_id"], name: "index_rates_on_user_id", using: :btree
  end

  create_table "travel_places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "description"
    t.integer  "cost"
    t.string   "avatar"
    t.float    "avg_rate",    limit: 24, default: 0.0
    t.integer  "status",                 default: 0
    t.integer  "category_id"
    t.integer  "city_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["category_id"], name: "index_travel_places_on_category_id", using: :btree
    t.index ["city_id"], name: "index_travel_places_on_city_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.integer  "role",                   default: 0
    t.string   "address"
    t.integer  "phone"
    t.string   "avatar"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "travel_places"
  add_foreign_key "comments", "users"
  add_foreign_key "rates", "travel_places"
  add_foreign_key "rates", "users"
  add_foreign_key "travel_places", "categories"
  add_foreign_key "travel_places", "cities"
end
