class Album < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id

  has_many :album_song
  has_many :songs, through: :album_song

  has_many :album_artist
  has_many :artists, through: :album_artist
end
