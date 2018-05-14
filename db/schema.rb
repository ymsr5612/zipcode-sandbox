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

ActiveRecord::Schema.define(version: 2018_05_11_144137) do

  create_table "yubins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "local_governments_cd"
    t.string "past_zipcode"
    t.string "zipcode", null: false
    t.string "region_kana", null: false
    t.string "locality_kana", null: false
    t.string "street_address_kana", null: false
    t.string "region", null: false
    t.string "locality", null: false
    t.string "street_address", null: false
    t.integer "flag_1", default: 0, null: false
    t.integer "flag_2", default: 0, null: false
    t.integer "flag_3", default: 0, null: false
    t.integer "flag_4", default: 0, null: false
    t.integer "view_update", default: 0, null: false
    t.integer "reason", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zipcode"], name: "index_yubins_on_zipcode"
  end

end
