class Artist < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  has_many :artist_song
  has_many :songs, through: :artist_song

  has_many :artist_genre
  has_many :genres, through: :artist_genre

  has_many :album_artist
  has_many :albums, through: :album_artist
end
