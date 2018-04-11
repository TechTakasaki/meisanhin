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

ActiveRecord::Schema.define(version: 20180329114951) do

  create_table "hokkaido_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "hokkaido_id"
    t.integer  "evaluation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hokkaido_id"], name: "index_hokkaido_reviews_on_hokkaido_id", using: :btree
    t.index ["user_id"], name: "index_hokkaido_reviews_on_user_id", using: :btree
  end

  create_table "hokkaidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "hokuriku_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "hokuriku_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hokuriku_id"], name: "index_hokuriku_reviews_on_hokuriku_id", using: :btree
    t.index ["user_id"], name: "index_hokuriku_reviews_on_user_id", using: :btree
  end

  create_table "hokurikus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "kansai_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "kansai_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kansai_id"], name: "index_kansai_reviews_on_kansai_id", using: :btree
    t.index ["user_id"], name: "index_kansai_reviews_on_user_id", using: :btree
  end

  create_table "kansais", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "kantou_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "kantou_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kantou_id"], name: "index_kantou_reviews_on_kantou_id", using: :btree
    t.index ["user_id"], name: "index_kantou_reviews_on_user_id", using: :btree
  end

  create_table "kantous", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "content"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "koushinetsu_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "koushinetsu_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["koushinetsu_id"], name: "index_koushinetsu_reviews_on_koushinetsu_id", using: :btree
    t.index ["user_id"], name: "index_koushinetsu_reviews_on_user_id", using: :btree
  end

  create_table "koushinetsus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "kyushu_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "kyushu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kyushu_id"], name: "index_kyushu_reviews_on_kyushu_id", using: :btree
    t.index ["user_id"], name: "index_kyushu_reviews_on_user_id", using: :btree
  end

  create_table "kyushus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "okinawa_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "okinawa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["okinawa_id"], name: "index_okinawa_reviews_on_okinawa_id", using: :btree
    t.index ["user_id"], name: "index_okinawa_reviews_on_user_id", using: :btree
  end

  create_table "okinawas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sanin_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "sanin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sanin_id"], name: "index_sanin_reviews_on_sanin_id", using: :btree
    t.index ["user_id"], name: "index_sanin_reviews_on_user_id", using: :btree
  end

  create_table "sanins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sanyo_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "sanyo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sanyo_id"], name: "index_sanyo_reviews_on_sanyo_id", using: :btree
    t.index ["user_id"], name: "index_sanyo_reviews_on_user_id", using: :btree
  end

  create_table "sanyos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shikoku_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "shikoku_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shikoku_id"], name: "index_shikoku_reviews_on_shikoku_id", using: :btree
    t.index ["user_id"], name: "index_shikoku_reviews_on_user_id", using: :btree
  end

  create_table "shikokus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "touhoku_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "touhoku_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["touhoku_id"], name: "index_touhoku_reviews_on_touhoku_id", using: :btree
    t.index ["user_id"], name: "index_touhoku_reviews_on_user_id", using: :btree
  end

  create_table "touhokus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "content"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "toukai_reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "evaluation"
    t.integer  "user_id"
    t.integer  "toukai_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toukai_id"], name: "index_toukai_reviews_on_toukai_id", using: :btree
    t.index ["user_id"], name: "index_toukai_reviews_on_user_id", using: :btree
  end

  create_table "toukais", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.string   "image_url"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "hp_url"
    t.string   "maker"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "age"
    t.string   "introduction"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "hokkaido_reviews", "hokkaidos"
  add_foreign_key "hokkaido_reviews", "users"
  add_foreign_key "hokuriku_reviews", "hokurikus"
  add_foreign_key "hokuriku_reviews", "users"
  add_foreign_key "kansai_reviews", "kansais"
  add_foreign_key "kansai_reviews", "users"
  add_foreign_key "kantou_reviews", "kantous"
  add_foreign_key "kantou_reviews", "users"
  add_foreign_key "koushinetsu_reviews", "koushinetsus"
  add_foreign_key "koushinetsu_reviews", "users"
  add_foreign_key "kyushu_reviews", "kyushus"
  add_foreign_key "kyushu_reviews", "users"
  add_foreign_key "okinawa_reviews", "okinawas"
  add_foreign_key "okinawa_reviews", "users"
  add_foreign_key "sanin_reviews", "sanins"
  add_foreign_key "sanin_reviews", "users"
  add_foreign_key "sanyo_reviews", "sanyos"
  add_foreign_key "sanyo_reviews", "users"
  add_foreign_key "shikoku_reviews", "shikokus"
  add_foreign_key "shikoku_reviews", "users"
  add_foreign_key "touhoku_reviews", "touhokus"
  add_foreign_key "touhoku_reviews", "users"
  add_foreign_key "toukai_reviews", "toukais"
  add_foreign_key "toukai_reviews", "users"
end
