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

ActiveRecord::Schema.define(version: 20171126193119) do

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
    t.string   "image"
    t.integer  "owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.string   "image"
    t.index ["owner_id"], name: "index_artists_on_owner_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favoritable_id"
    t.string   "favoritable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id", using: :btree
    t.index ["follower_id"], name: "index_follows_on_follower_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_relations", force: :cascade do |t|
    t.integer  "news_id"
    t.integer  "newsable_id"
    t.string   "newsable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["news_id"], name: "index_news_relations_on_news_id", using: :btree
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "owner_id"
    t.integer  "ranking"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "youtube_url"
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
    t.string   "photo"
  end

  create_table "wall_messages", force: :cascade do |t|
    t.integer  "writer_id"
    t.integer  "receiver_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["receiver_id"], name: "index_wall_messages_on_receiver_id", using: :btree
    t.index ["writer_id"], name: "index_wall_messages_on_writer_id", using: :btree
  end

  add_foreign_key "albums", "users", column: "owner_id", on_delete: :cascade
  add_foreign_key "artists", "users", column: "owner_id", on_delete: :cascade
  add_foreign_key "songs", "users", column: "owner_id", on_delete: :cascade
end
