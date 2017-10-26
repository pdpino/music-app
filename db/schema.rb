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

ActiveRecord::Schema.define(version: 20171026211038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_artists", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_artists_on_album_id", using: :btree
    t.index ["artist_id"], name: "index_album_artists_on_artist_id", using: :btree
  end

  create_table "album_songs", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_songs_on_album_id", using: :btree
    t.index ["song_id"], name: "index_album_songs_on_song_id", using: :btree
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "release_date"
    t.boolean  "is_single"
    t.string   "artwork_img_name"
    t.integer  "owner_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["owner_id"], name: "index_albums_on_owner_id", using: :btree
  end

  create_table "artist_genres", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_genres_on_artist_id", using: :btree
    t.index ["genre_id"], name: "index_artist_genres_on_genre_id", using: :btree
  end

  create_table "artist_songs", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_songs_on_artist_id", using: :btree
    t.index ["song_id"], name: "index_artist_songs_on_song_id", using: :btree
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "country"
    t.string   "members"
    t.date     "active_since"
    t.date     "active_until"
    t.integer  "owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["owner_id"], name: "index_artists_on_owner_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favoritable_id"
    t.string   "favoritable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_genres", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_song_genres_on_genre_id", using: :btree
    t.index ["song_id"], name: "index_song_genres_on_song_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_songs_on_owner_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "picture"
  end

  add_foreign_key "albums", "users", column: "owner_id", on_delete: :cascade
  add_foreign_key "artists", "users", column: "owner_id", on_delete: :cascade
  add_foreign_key "songs", "users", column: "owner_id", on_delete: :cascade
end
