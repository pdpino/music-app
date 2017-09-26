class Genre < ApplicationRecord
  has_many :song_genre
  has_many :songs, through: :song_genre

  has_many :artist_genre
  has_many :artists, through: :artist_genre
end
