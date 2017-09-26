class Genre < ApplicationRecord
  has_many :song_genre
  has_many :songs, through: :song_genre
end
