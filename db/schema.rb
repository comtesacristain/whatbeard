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

ActiveRecord::Schema.define(version: 20150831114600) do

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "lastfm_url"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "lastfm_url"
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "source"
    t.integer  "recommended_id"
    t.string   "recommended_type"
  end

  add_index "recommendations", ["recommended_id"], name: "index_recommendations_on_recommended_id"

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.integer  "album_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "filepath"
    t.integer  "artist_id"
    t.string   "file_status"
    t.string   "location"
  end

  add_index "tracks", ["artist_id"], name: "index_tracks_on_artist_id"

end
