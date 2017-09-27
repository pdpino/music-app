class Song < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  has_many :artist_song
  has_many :artists, through: :artist_song

  has_many :song_genre
  has_many :genres, through: :song_genre

  has_many :album_song
  has_many :albums, through: :album_song
end
