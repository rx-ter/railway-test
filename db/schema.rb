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

ActiveRecord::Schema.define(version: 20180806172911) do

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "address"
    t.integer "train_route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_route_id"], name: "index_stations_on_train_route_id"
  end

  create_table "train_routes", force: :cascade do |t|
    t.integer "departure_station_id"
    t.integer "arrival_station_id"
    t.integer "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_train_routes_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.integer "train_route_id"
    t.integer "passengers_capacity"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "user_name"
    t.integer "train_id"
    t.string "description"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
